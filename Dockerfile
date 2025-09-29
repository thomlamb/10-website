FROM node:20-alpine

WORKDIR /app

COPY package.json package-lock.json* yarn.lock* pnpm-lock.yaml* ./

RUN npm install --production

COPY . .

RUN npm run build

EXPOSE 5000

CMD ["npm", "start"]
