// METAPOKER - JavaScript Premium 2024 - Versión Mejorada
if (location.hostname==='localhost') console.log('  METAPOKER Landing Page Premium - Cargada');

// ===== CONFIGURACIÓN GLOBAL =====
const CONFIG = {
  whatsappNumber: '584269204485',
  carouselInterval: 6000,
  animationDuration: 800,
  scrollOffset: 100
};

// ===== SMOOTH SCROLLING MEJORADO =====
document.querySelectorAll('a[href^="#"]').forEach(anchor=>{
  anchor.addEventListener('click',function(e){
    e.preventDefault();
    const target=document.querySelector(this.getAttribute('href'));
    if(!target) return;
    
    const prefersReduced=window.matchMedia('(prefers-reduced-motion:reduce)').matches;
    const headerOffset = CONFIG.scrollOffset;
    const elementPosition = target.getBoundingClientRect().top;
    const offsetPosition = elementPosition + window.pageYOffset - headerOffset;
    
    window.scrollTo({
      top: offsetPosition,
      behavior: prefersReduced ? 'auto' : 'smooth'
    });
  });
});

// ===== FORMULARIO MEJORADO =====
const form=document.getElementById('schedule-form');
if(form){
  // Añadir contador de caracteres
  const textarea = form.querySelector('textarea[name="purpose"]');
  const helpText = document.getElementById('purpose-help');
  
  if(textarea && helpText){
    const maxLength = 500;
    const counter = document.createElement('div');
    counter.style.cssText = 'text-align:right;font-size:0.8rem;color:var(--clr-text-muted);margin-top:0.25rem;';
    helpText.parentNode.insertBefore(counter, helpText.nextSibling);
    
    textarea.addEventListener('input', function(){
      const remaining = maxLength - this.value.length;
      counter.textContent = `${remaining} caracteres restantes`;
      counter.style.color = remaining < 50 ? '#e11d48' : 'var(--clr-text-muted)';
    });
    
    // Trigger inicial
    textarea.dispatchEvent(new Event('input'));
  }
  
  form.addEventListener('submit',function(e){
    e.preventDefault();
    
    // Mostrar loading
    const submitBtn = form.querySelector('button[type="submit"]');
    const originalText = submitBtn.innerHTML;
    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Enviando...';
    submitBtn.disabled = true;
    
    const data=Object.fromEntries(new FormData(e.target).entries());
    Object.keys(data).forEach(k=>{data[k]=data[k].trim().replace(/[<>]/g,'');});
    
    if(!validateForm(data)){
      submitBtn.innerHTML = originalText;
      submitBtn.disabled = false;
      return;
    }
    
    const userDateTime=new Date(data.datetime);
    const formattedTime=userDateTime.toLocaleString('es-ES',{dateStyle:'full',timeStyle:'short'});
    const message=`  *Nueva Solicitud de Sesión Estratégica - METAPOKER*\n\n*Nombre:* ${data.name}\n*País:* ${data.country}\n*Fecha propuesta:* ${formattedTime}\n\n*Situación actual:* \n${data.purpose}\n\nEn METAPOKER ayudamos a desarrollar jugadores de forma integral (técnica, mental y gestión). \nTe contactaremos para crear un plan personalizado que se ajuste a tus necesidades.\n\n¡Nos vemos pronto!`;
    
    const whatsappUrl=`https://wa.me/${CONFIG.whatsappNumber}?text=${encodeURIComponent(message)}`;
    
    // Simular delay para mejor UX
    setTimeout(()=>{
      window.open(whatsappUrl,'_blank');
      showSuccessMessage();
      e.target.reset();
      if(counter) counter.textContent = '';
      submitBtn.innerHTML = originalText;
      submitBtn.disabled = false;
    }, 1500);
  });
}

function validateForm(data){
  if(data.name.length<2){showValidationError('Por favor ingresa tu nombre completo');return false;}
  if(data.country.length<2){showValidationError('Por favor ingresa tu país');return false;}
  if(!data.datetime){showValidationError('Por favor selecciona una fecha y hora');return false;}
  const selectedDate=new Date(data.datetime);
  if(selectedDate<=new Date()){showValidationError('Por favor selecciona una fecha y hora futura');return false;}
  if(data.purpose.length<10){showValidationError('Por favor cuéntanos más sobre tu situación (mínimo 10 caracteres)');return false;}
  return true;
}

function showValidationError(message){
  const errorDiv = document.createElement('div');
  errorDiv.innerHTML = `<div style="position:fixed;top:20px;right:20px;background:linear-gradient(135deg,#ef4444,#dc2626);color:white;padding:1rem 1.5rem;border-radius:0.5rem;z-index:1000;animation:slideIn 0.3s ease;">⚠️ ${message}</div>`;
  document.body.appendChild(errorDiv);
  setTimeout(()=>errorDiv.remove(),4000);
}

function showSuccessMessage(){
  const msg=document.createElement('div');
  msg.innerHTML=`<div role="status" aria-live="polite" style="position:fixed;top:20px;right:20px;background:linear-gradient(135deg,#10b981,#34d399);color:white;padding:1.5rem 2.5rem;border-radius:1rem;z-index:1000;animation:slideIn 0.5s ease;box-shadow:0 10px 30px rgba(16,185,129,0.4);font-size:1.1rem;">✓ ¡Solicitud enviada! Te contactaremos en menos de 24h vía WhatsApp.</div>`;
  document.body.appendChild(msg);
  setTimeout(()=>msg.remove(),5000);
}

// ===== CARRUSEL MEJORADO =====
let currentSlide=0;const totalSlides=7;let carouselPaused=false;let touchStartX=0;
const carousel=document.getElementById('testimonials-carousel');
const indicators=document.querySelectorAll('.indicator');

window.moveCarousel=function(direction){
  currentSlide=(currentSlide+direction+totalSlides)%totalSlides;
  updateCarousel();
};

window.goToSlide=function(index){
  currentSlide=index;
  updateCarousel();
};

function updateCarousel(){
  const offset=-currentSlide*100;
  carousel.style.transform=`translateX(${offset}%)`;
  indicators.forEach((dot,i)=>dot.classList.toggle('active',i===currentSlide));
  
  // Añadir animación de fade a las tarjetas
  const cards = carousel.querySelectorAll('.testimonial-card');
  cards.forEach(card => {
    card.style.opacity = '0';
    card.style.transform = 'scale(0.95)';
  });
  
  setTimeout(() => {
    const currentCard = cards[currentSlide];
    if(currentCard){
      currentCard.style.opacity = '1';
      currentCard.style.transform = 'scale(1)';
    }
  }, 250);
}

// Auto-play mejorado
let autoPlayInterval;
function startAutoPlay(){
  autoPlayInterval = setInterval(()=>{
    if(!carouselPaused) moveCarousel(1);
  }, CONFIG.carouselInterval);
}

function stopAutoPlay(){
  clearInterval(autoPlayInterval);
}

carousel.addEventListener('mouseenter',()=>carouselPaused=true);
carousel.addEventListener('mouseleave',()=>carouselPaused=false);
carousel.addEventListener('focusin',()=>carouselPaused=true);
carousel.addEventListener('focusout',()=>carouselPaused=false);

// Touch mejorado
carousel.addEventListener('touchstart',e=>{
  touchStartX=e.changedTouches[0].screenX;
  stopAutoPlay();
},{passive:true});

carousel.addEventListener('touchend',e=>{
  const touchEndX=e.changedTouches[0].screenX;
  const diff = touchStartX - touchEndX;
  
  if(Math.abs(diff) > 50){
    if(diff > 0) moveCarousel(1);
    else moveCarousel(-1);
  }
  
  startAutoPlay();
},{passive:true});

// Keyboard navigation mejorada
document.addEventListener('keydown',e=>{
  if(e.target.tagName==='INPUT'||e.target.tagName==='TEXTAREA') return;
  
  switch(e.key){
    case 'ArrowLeft':
      e.preventDefault();
      moveCarousel(-1);
      break;
    case 'ArrowRight':
      e.preventDefault();
      moveCarousel(1);
      break;
    case ' ':
      e.preventDefault();
      carouselPaused = !carouselPaused;
      break;
  }
});

// ===== OBSERVER DE INTERSECCIÓN MEJORADO =====
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -100px 0px'
};

const observer=new IntersectionObserver((entries)=>{
  entries.forEach(entry=>{
    if(entry.isIntersecting){
      const delay = entry.target.dataset.delay || 0;
      setTimeout(() => {
        entry.target.style.opacity='1';
        entry.target.style.transform='translateY(0)';
        observer.unobserve(entry.target);
      }, delay);
    }
  });
}, observerOptions);

// Observar elementos con animación
document.addEventListener('DOMContentLoaded',()=>{
  document.querySelectorAll('.section, .pricing-card, .value-card, .service-step').forEach((el,index)=>{
    el.style.opacity='0';
    el.style.transform='translateY(40px)';
    el.style.transition=`all ${CONFIG.animationDuration}ms ease-out`;
    el.dataset.delay = index * 100; // Stagger animation
    observer.observe(el);
  });
});

// ===== UTILIDADES ADICIONALES =====

// Botón de scroll to top
const scrollTopBtn = document.createElement('button');
scrollTopBtn.innerHTML = '<i class="fas fa-arrow-up"></i>';
scrollTopBtn.style.cssText = 'position:fixed;bottom:30px;right:30px;width:50px;height:50px;border-radius:50%;background:var(--clr-primary);color:white;border:none;cursor:pointer;opacity:0;transition:all 0.3s ease;z-index:999;';
document.body.appendChild(scrollTopBtn);

window.addEventListener('scroll',()=>{
  if(window.pageYOffset > 300){
    scrollTopBtn.style.opacity = '1';
  } else {
    scrollTopBtn.style.opacity = '0';
  }
});

scrollTopBtn.addEventListener('click',()=>{
  window.scrollTo({top:0,behavior:'smooth'});
});

// Animación de entrada para el botón
setTimeout(()=>{
  scrollTopBtn.style.animation = 'fadeInUp 0.5s ease forwards';
},1000);

// ===== CSS ANIMATIONS =====
const style = document.createElement('style');
style.textContent = `
@keyframes slideIn {
  from { opacity: 0; transform: translateX(100%); }
  to { opacity: 1; transform: translateX(0); }
}
@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(30px); }
  to { opacity: 1; transform: translateY(0); }
}
`;
document.head.appendChild(style);

// ===== INICIALIZAR =====
startAutoPlay();

// Detectar preferencias del usuario
if(window.matchMedia('(prefers-reduced-motion:reduce)').matches){
  carouselPaused = true;
  stopAutoPlay();
}

console.log('  METAPOKER JavaScript Premium - Versión Mejorada Cargada');
