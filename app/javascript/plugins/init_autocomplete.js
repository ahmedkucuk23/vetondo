import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('adress');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
