FROM node:20-alpine as builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --omit=dev

# Copy application source
COPY app.js ./
COPY public/ ./public/
COPY routes/ ./routes/
COPY views/ ./views/

FROM node:20-alpine

WORKDIR /app

# Copy from builder
COPY --from=builder /app ./

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

USER nodejs

# Expose port 3001 (as defined in app.js)
EXPOSE 3001

CMD ["node", "app.js"]
