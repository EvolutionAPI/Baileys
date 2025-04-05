#!/bin/bash

# Nome da branch principal que você quer manter atualizada
BRANCH_PRINCIPAL="master"  # ou "master" se for o caso

echo "🔄 Atualizando seu repositório com o original (upstream)..."

# Verifica se há alterações não commitadas
if [[ -n $(git status --porcelain) ]]; then
  echo "⚠️  Você tem alterações não commitadas!"
  echo "💡 Faça commit ou stash antes de continuar."
  exit 1
fi

# Garante que estamos na branch principal
echo "✅ Alternando para a branch '$BRANCH_PRINCIPAL'..."
git checkout "$BRANCH_PRINCIPAL"

# Busca as atualizações do repo original
echo "📡 Buscando atualizações do 'upstream'..."
git fetch upstream

# Mescla o conteúdo do upstream/main
echo "🔁 Mesclando com 'upstream/$BRANCH_PRINCIPAL'..."
git merge upstream/"$BRANCH_PRINCIPAL"

# Atualiza seu fork no GitHub
echo "📤 Enviando alterações para seu fork (origin)..."
git push origin "$BRANCH_PRINCIPAL"

echo "✅ Atualização concluída!"