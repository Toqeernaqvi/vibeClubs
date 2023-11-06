const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  let counter = 0
  while (counter < input.files.length) {
    if (input.files && input.files[counter]) {
        const reader = new FileReader();
        reader.onload = (event) => {
          // document.getElementById('photo-preview').src = event.currentTarget.result;
          const imgLink = event.currentTarget.result;
          const previews = document.getElementById('photos-preview');
          const img = `<img class="img-preview" src='${imgLink}'>`
          previews.insertAdjacentHTML('beforeend', img)
          console.log(input.files.length)
        }
        reader.readAsDataURL(input.files[counter])
        counter += 1
      }
  }

}

export { previewImageOnFileSelect };
