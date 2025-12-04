# Têmpera - Escola de Artes 🎨

Site da Escola de Artes Têmpera, hospedado no Azure App Service com deploy automático via GitHub Actions.

## 🌐 Site ao Vivo

**URL:** https://tempera-escola-artes-bruna.azurewebsites.net

## 🏗️ Tecnologias

- **Frontend:** HTML5, CSS3, JavaScript
- **Hospedagem:** Azure App Service (Windows, Basic tier)
- **CI/CD:** GitHub Actions
- **Região:** Brazil South (brazilsouth)

## 📂 Estrutura do Projeto

```
.
├── index.html                    # Página principal
├── images/                       # Imagens do site
│   ├── logo.png
│   ├── professora.jpg
│   ├── aluno-1.jpg até aluno-8.jpg
│   ├── plan-online.jpg
│   └── plan-presencial.jpg
├── .github/workflows/
│   └── azure-webapps.yml        # Workflow GitHub Actions para deploy automático
├── tempera_publish_profile.xml  # Perfil de publicação do Azure (NÃO commitar em público!)
├── .gitignore                   # Arquivo gitignore
└── README.md                    # Este arquivo
```

## 🚀 Deploy Automático com GitHub Actions

O repositório está configurado com GitHub Actions para deploy automático. A cada push para a branch `main`, o workflow faz o build e deploy automático para o Azure.

### Configuração Necessária

Para que o GitHub Actions funcione, você deve adicionar um **repositório secreto** no GitHub:

1. Acesse o repositório no GitHub: https://github.com/walleycosta/tempera-escola-artes
2. Vá em **Settings** → **Secrets and variables** → **Actions** → **New repository secret**
3. **Nome do secreto:** `AZURE_WEBAPP_PUBLISH_PROFILE`
4. **Valor:** Copie todo o conteúdo do arquivo `tempera_publish_profile.xml` (está no workspace)
5. Clique em **Add secret**

Após adicionar o secreto, qualquer push para `main` acionará o deployment automático.

### Fluxo de Deploy

```
git push → GitHub → GitHub Actions Workflow → Azure App Service
```

## 📝 Como Fazer Alterações

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/walleycosta/tempera-escola-artes.git
   cd tempera-escola-artes
   ```

2. **Faça suas alterações** (edite arquivos HTML, CSS, etc.)

3. **Commit e push:**
   ```bash
   git add .
   git commit -m "Descrição das alterações"
   git push origin main
   ```

4. **Aguarde o deploy** — GitHub Actions fará o deployment automático para https://tempera-escola-artes-bruna.azurewebsites.net

## 🔐 Credenciais Sensíveis

- **`tempera_publish_profile.xml`** contém credenciais do Azure. **NÃO faça commit/push deste arquivo para repositórios públicos.** Ele já está no `.gitignore`, mas tenha cuidado ao adicionar arquivos.
- **`AZURE_WEBAPP_PUBLISH_PROFILE`** deve ser adicionado **apenas** como um repositório secreto no GitHub (não em código).

## 🛠️ Ferramentas Usadas

- **Azure CLI** — gerenciamento de recursos Azure
- **Git** — controle de versão
- **GitHub Actions** — CI/CD

## 📞 Próximos Passos (Opcional)

- **Domínio personalizado:** Configure um domínio próprio (ex.: `escola-artes.com.br`) nas configurações do Web App do Azure.
- **HTTPS:** O Azure fornece certificado SSL gratuito automaticamente.
- **Monitor:** Use Azure Portal para monitorar performance, logs e métricas do site.
- **Backup:** Configure backups automáticos dos dados do aplicativo.

## 📖 Referências

- [Documentação Azure App Service](https://docs.microsoft.com/azure/app-service/)
- [GitHub Actions para Azure](https://github.com/Azure/webapps-deploy)
- [Azure CLI Documentation](https://docs.microsoft.com/cli/azure/)

---

**Criado em:** 4 de Dezembro de 2025  
**Repositório:** https://github.com/walleycosta/tempera-escola-artes

