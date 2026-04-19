function justifyLine(lineSpan) {
  const containerWidth = lineSpan.parentElement.getBoundingClientRect().width;
  const items = Array.from(lineSpan.children);
  if (items.length === 0) return;
  items.forEach(el => el.style.letterSpacing = '0');
  const totalTextWidth = items.reduce((sum, el) => sum + el.getBoundingClientRect().width, 0);
  const totalChars = items.reduce((sum, el) => sum + el.textContent.length, 0);
  if (totalChars === 0) return;
  if (totalTextWidth / containerWidth < 0.75) return;
  const spacing = (containerWidth - totalTextWidth) / totalChars;
  items.forEach(el => el.style.letterSpacing = spacing + 'px');
}
document.querySelectorAll('span[style*="display:flex"]').forEach(justifyLine);
