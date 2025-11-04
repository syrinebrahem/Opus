# Stage 1: build dependencies (node modules)
FROM node:18-alpine AS builder
WORKDIR /app
COPY app/package.json app/package-lock.json* ./
RUN npm ci --production=false
COPY app/. .
# (no build step for simple app, but keep pattern)
RUN npm run lint || true

# Stage 2: runtime (smaller image)
FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src
EXPOSE 3000
CMD ["node", "src/index.js"]
