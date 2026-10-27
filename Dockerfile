# Calculiva Cut Planner MCP server (stdio), installed from the published npm package.
FROM node:22-alpine
ARG VERSION=0.2.0
RUN npm install -g --omit=dev "calculiva-mcp@${VERSION}" && npm cache clean --force
USER node
ENTRYPOINT ["calculiva-mcp"]
