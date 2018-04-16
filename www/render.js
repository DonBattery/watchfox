'use strict';

function render(report) {
  const reportData = document.createElement('div');
  reportData.innerHTML = `
  <div class="statusHead">${report.name}</div>
  <div class="statusHead">${report.url}</div>
  <div class="statusBox">
    <div class="statusReport ${report.server}">${report.server}</div>
    <div class="statusReport ${report.app}">${report.app}</div>
    <div class="statusReport ${report.db}">${report.db}</div>
  </div>    
  `
  reportData.classList = 'reportBox';  
  document.getElementById('reports').appendChild(reportData);  
}

window.addEventListener('load', () => {
  document.getElementById('generationTime').innerText = statusData.timeStamp;
  statusData.services.forEach(report => render(report));
});