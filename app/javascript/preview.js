document.addEventListener('turbo:load', function(){
  const previewList = document.getElementById('previews');
  const fileField = document.getElementById('item-image');
  if (fileField) {
    fileField.addEventListener('change', function (e) {
      const alreadyPreview = previewList.querySelector('.preview');
      if (alreadyPreview) {
        alreadyPreview.remove();
      };
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const previewWrapper = document.createElement('div');
      previewWrapper.setAttribute('class', 'preview');
      const previewImage = document.createElement('img');
      previewImage.setAttribute('class', 'preview-image');
      previewImage.setAttribute('src', blob);
      previewWrapper.appendChild(previewImage);
      previewList.appendChild(previewWrapper);
    });
  }
});