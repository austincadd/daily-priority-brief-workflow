#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

const root = path.resolve(__dirname, '..');
const templatePath = path.join(root, 'templates', 'scheduled-workflow.json');
const outPath = process.argv[2] || path.join(root, 'dist', 'scheduled-workflow.rendered.json');

const vars = {
  SEARCH_QUERY_1: process.env.SEARCH_QUERY_1 || 'AI model released launched today',
  SEARCH_QUERY_2: process.env.SEARCH_QUERY_2 || 'OpenAI Anthropic Google AI news today',
};

let text = fs.readFileSync(templatePath, 'utf8');
for (const [k, v] of Object.entries(vars)) {
  text = text.replaceAll(`{{${k}}}`, v);
}
fs.mkdirSync(path.dirname(outPath), { recursive: true });
fs.writeFileSync(outPath, text);
console.log(`Rendered workflow to ${outPath}`);
