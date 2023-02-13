# Aplicação simples, desenvolvida por fabrício veronez, utilizada com o objetivo de integração CI/CD.  

# O script da jenkinsfile é responsável por:

1 - Buildar uma Dockerfile e enviar a imagem para o repositório do dockerhub

2 - Remoção de qualquer container sendo executado com o objetivo de substituir a imagem com tag antiga por uma atual

3 - Substituição da imagem antiga por a tag mais atual

4 - Subir o serviço do docker compose junto com o traefik

5 - Remover imagens inutilizadas

6 - Validação para remoção dos serviços da etapa 4



