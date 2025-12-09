# 🚀 GUIA RÁPIDO - Colocar site no ar

## ✅ PASSO 1: Comprar o Domínio (FAZER AGORA - 10 min)

### Opção A: Registro.br (domínio brasileiro)
1. Acesse: https://registro.br
2. Busque: temperaescoladeartes.org.br
3. Complete o cadastro e pagamento (~R$ 40/ano)

### Opção B: Namecheap (domínio internacional .org)
1. Acesse: https://www.namecheap.com
2. Busque: temperaescoladeartes.org
3. Complete a compra (~$13/ano)

---

## ✅ PASSO 2: Criar Repositório no GitHub (5 min)

1. Acesse: https://github.com/new
2. Nome do repositório: `tempera-site` ou `temperaescoladeartes.org`
3. Deixe PÚBLICO
4. NÃO adicione README, .gitignore ou license
5. Clique em "Create repository"

---

## ✅ PASSO 3: Subir Arquivos para GitHub (5 min)

Execute estes comandos no PowerShell (na pasta do site):

```powershell
# Ir para a pasta do site
cd 'c:\Users\walle\OneDrive\Documentos\Tempera Escola de Artes\site'

# Inicializar Git
git init

# Adicionar todos os arquivos
git add .

# Fazer commit
git commit -m "Primeiro commit - Site Têmpera Escola de Artes"

# Renomear branch para main
git branch -M main

# Adicionar o repositório remoto (SUBSTITUIR pelo seu)
# Exemplo: git remote add origin https://github.com/SEU-USUARIO/tempera-site.git
git remote add origin https://github.com/SEU-USUARIO/SEU-REPOSITORIO.git

# Enviar para GitHub
git push -u origin main
```

---

## ✅ PASSO 4: Ativar GitHub Pages (2 min)

1. No GitHub, vá em: Settings > Pages (menu lateral)
2. Em "Source", selecione: `main` branch
3. Clique em "Save"
4. Aguarde 1-2 minutos
5. Seu site estará em: `https://SEU-USUARIO.github.io/SEU-REPOSITORIO`

---

## ✅ PASSO 5: Configurar Domínio Personalizado (10-20 min)

### No seu registrador de domínio:

Adicione estes registros DNS:

**Tipo A (adicione os 4):**
```
@    A    185.199.108.153
@    A    185.199.109.153
@    A    185.199.110.153
@    A    185.199.111.153
```

**Tipo CNAME:**
```
www    CNAME    SEU-USUARIO.github.io.
```

### No GitHub:

1. Vá em: Settings > Pages
2. Em "Custom domain", digite: `temperaescoladeartes.org`
3. Clique em "Save"
4. Aguarde a verificação DNS (pode levar até 24h, mas geralmente 10-30 min)
5. Marque "Enforce HTTPS" quando disponível

---

## 📝 CHECKLIST FINAL

- [ ] Domínio comprado
- [ ] Repositório GitHub criado
- [ ] Arquivos enviados para GitHub
- [ ] GitHub Pages ativado
- [ ] DNS configurado
- [ ] Domínio personalizado configurado
- [ ] HTTPS ativado

---

## ⏱️ TEMPO TOTAL: 30-60 minutos

## 🎉 PRONTO!

Seu site estará acessível em:
- https://temperaescoladeartes.org
- https://www.temperaescoladeartes.org

---

## 🆘 PRECISA DE AJUDA?

### Se o site não aparecer:
1. Aguarde alguns minutos (propagação DNS)
2. Limpe o cache do navegador (Ctrl + F5)
3. Verifique se o DNS foi configurado corretamente
4. Verifique se o GitHub Pages está ativo

### Comandos Git não funcionam?
Instale o Git: https://git-scm.com/download/win
