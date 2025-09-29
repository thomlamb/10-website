FROM node:20-alpine

WORKDIR /app


COPY package.json package-lock.json* yarn.lock* pnpm-lock.yaml* ./
RUN npm install

COPY . .

RUN npm run build

# Optionnel : supprimer les dépendances de dev pour alléger l'image
RUN npm prune --production


ENV PORT=5000

EXPOSE 5000

CMD ["npm", "start"]
