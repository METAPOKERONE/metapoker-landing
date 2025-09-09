// METAPOKER - JavaScript Premium 2024
if (location.hostname==='localhost') console.log('��� METAPOKER Landing Page Premium - Cargada');

// Smooth scrolling respetando prefers-reduced-motion
document.querySelectorAll('a[href^="#"]').forEach(anchor=>{
  anchor.addEventListener('click',function(e){
    e.preventDefault();
    const target=document.querySelector(this.getAttribute('href'));
    if(!target) return;
    const prefersReduced=window.matchMedia('(prefers-reduced-motion:reduce)').matches;
    target.scrollIntoView({behavior:prefersReduced?'auto':'smooth',block:'start'});
  });
});

// Formulario
const form=document.getElementById('schedule-form');
if(form){
  form.addEventListener('submit',function(e){
    e.preventDefault();
    const data=Object.fromEntries(new FormData(e.target).entries());
    Object.keys(data).forEach(k=>{data[k]=data[k].trim().replace(/[<>]/g,'');});
    if(!validateForm(data)) return;
    const userDateTime=new Date(data.datetime);
    const formattedTime=userDateTime.toLocaleString('es-ES',{dateStyle:'full',timeStyle:'short'});
    const message=`��� *Nueva Solicitud de Sesión Estratégica - METAPOKER*\n\n*Nombre:* ${data.name}\n*País:* ${data.country}\n*Fecha propuesta:* ${formattedTime}\n\n*Situación actual:* \n${data.purpose}\n\nEn METAPOKER ayudamos a desarrollar jugadores de forma integral (técnica, mental y gestión). \nTe contactaremos para crear un plan personalizado que se ajuste a tus necesidades.\n\n¡Nos vemos pronto!`;
    const whatsappUrl=`https://wa.me/584269204485?text=${encodeURIComponent(message)}`;
    window.open(whatsappUrl,'_blank');
    showSuccessMessage();
    e.target.reset();
  });
}

function validateForm(data){
  if(data.name.length<2){alert('Por favor ingresa tu nombre completo');return false;}
  if(data.country.length<2){alert('Por favor ingresa tu país');return false;}
  if(!data.datetime){alert('Por favor selecciona una fecha y hora');return false;}
  const selectedDate=new Date(data.datetime);
  if(selectedDate<=new Date()){alert('Por favor selecciona una fecha y hora futura');return false;}
  if(data.purpose.length<10){alert('Por favor cuéntanos más sobre tu situación (mínimo 10 caracteres)');return false;}
  return true;
}

function showSuccessMessage(){
  const msg=document.createElement('div');
  msg.innerHTML=`<div role="status" aria-live="polite" style="position:fixed;top:20px;right:20px;background:linear-gradient(135deg,#10b981,#34d399);color:white;padding:1.5rem 2.5rem;border-radius:1rem;z-index:1000;animation:slideIn 0.5s ease;box-shadow:0 10px 30px rgba(16,185,129,0.4);font-size:1.1rem;">✓ ¡Solicitud enviada! Te contactaremos en menos de 24h vía WhatsApp.</div>`;
  document.body.appendChild(msg);
  setTimeout(()=>msg.remove(),5000);
}

/* Carrusel */
let currentSlide=0;const totalSlides=7;let carouselPaused=false;const carousel=document.getElementById('testimonials-carousel');const indicators=document.querySelectorAll('.indicator');
window.moveCarousel=function(direction){currentSlide=(currentSlide+direction+totalSlides)%totalSlides;updateCarousel();};
window.goToSlide=function(index){currentSlide=index;updateCarousel();};
function updateCarousel(){const offset=-currentSlide*100;carousel.style.transform=`translateX(${offset}%)`;indicators.forEach((dot,i)=>dot.classList.toggle('active',i===currentSlide));}
carousel.addEventListener('mouseenter',()=>carouselPaused=true);carousel.addEventListener('mouseleave',()=>carouselPaused=false);carousel.addEventListener('focusin',()=>carouselPaused=true);carousel.addEventListener('focusout',()=>carouselPaused=false);
setInterval(()=>{if(!carouselPaused)moveCarousel(1);},6000);
let touchStartX=0;carousel.addEventListener('touchstart',e=>{touchStartX=e.changedTouches[0].screenX;},{passive:true});carousel.addEventListener('touchend',e=>{const touchEndX=e.changedTouches[0].screenX;if(touchEndX<touchStartX-50)moveCarousel(1);if(touchEndX>touchStartX+50)moveCarousel(-1);},{passive:true});
document.addEventListener('keydown',e=>{if(e.target.tagName==='INPUT'||e.target.tagName==='TEXTAREA')return;if(e.key==='ArrowLeft')moveCarousel(-1);if(e.key==='ArrowRight')moveCarousel(1);});
const observer=new IntersectionObserver((entries)=>{entries.forEach(entry=>{if(entry.isIntersecting){entry.target.style.opacity='1';entry.target.style.transform='translateY(0)';observer.unobserve(entry.target);}});},{threshold:0.1,rootMargin:'0px 0px -100px 0px'});
document.querySelectorAll('.section').forEach(el=>{el.style.opacity='0';el.style.transform='translateY(40px)';el.style.transition='all 0.8s ease-out';observer.observe(el);});

// ===== ANIMACIONES PREMIUM PARA BADGES =====
// Observador para animar badges cuando entran en vista
const badgeObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const badge = entry.target;
      badge.style.animation = 'floatElegant 3s ease-in-out infinite';
      
      // Animación de entrada elegante
      badge.style.opacity = '0';
      badge.style.transform = 'translateX(-50%) translateY(20px)';
      
      setTimeout(() => {
        badge.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
        badge.style.opacity = '1';
        badge.style.transform = 'translateX(-50%) translateY(0)';
      }, 200);
      
      badgeObserver.unobserve(badge);
    }
  });
}, { threshold: 0.5 });

// Observar todos los badges
document.querySelectorAll('.plan-badge, .popular-badge').forEach(badge => {
  badge.style.opacity = '0';
  badgeObserver.observe(badge);
});

// Efecto parallax sutil en las cards
const cards = document.querySelectorAll('.pricing-card');
cards.forEach((card, index) => {
  card.style.transition = 'transform 0.3s ease, box-shadow 0.3s ease';
  
  card.addEventListener('mouseenter', () => {
    card.style.transform = 'translateY(-8px) scale(1.02)';
  });
  
  card.addEventListener('mouseleave', () => {
    card.style.transform = 'translateY(0) scale(1)';
  });
});

console.log('✅ Animaciones premium para badges cargadas');

// ===== EFECTOS PREMIUM PARA BADGES =====
// Efecto de entrada dramática
const badgeObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const badge = entry.target;
      
      // Entrada desde arriba con delay escalonado
      badge.style.opacity = '0';
      badge.style.transform = 'translateX(-50%) translateY(-20px)';
      
      setTimeout(() => {
        badge.style.transition = 'all 0.8s cubic-bezier(0.4, 0, 0.2, 1)';
        badge.style.opacity = '1';
        badge.style.transform = 'translateX(-50%) translateY(0)';
        
        // Efecto de brillo inicial
        badge.style.animation = 'badgeGlow 2s ease-in-out';
      }, entry.target.dataset.delay || 0);
      
      badgeObserver.unobserve(badge);
    }
  });
}, { threshold: 0.3 });

// Aplicar a todos los badges con delay escalonado
document.querySelectorAll('.plan-badge, .popular-badge').forEach((badge, index) => {
  badge.style.opacity = '0';
  badge.dataset.delay = index * 200; // Delay escalonado
  badgeObserver.observe(badge);
});

// Efecto parallax en hover
const cards = document.querySelectorAll('.pricing-card');
cards.forEach(card => {
  card.addEventListener('mousemove', (e) => {
    const badge = card.querySelector('.plan-badge, .popular-badge');
    if (!badge) return;
    
    const rect = card.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;
    
    const centerX = rect.width / 2;
    const centerY = rect.height / 2;
    
    const rotateX = (y - centerY) / 20;
    const rotateY = (centerX - x) / 20;
    
    badge.style.transform = `translateX(-50%) translateY(-2px) scale(1.05) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
  });
  
  card.addEventListener('mouseleave', () => {
    const badge = card.querySelector('.plan-badge, .popular-badge');
    if (badge) {
      badge.style.transform = 'translateX(-50%) translateY(0) scale(1) rotateX(0) rotateY(0)';
    }
  });
});

// CSS para el efecto de brillo
const style = document.createElement('style');
style.textContent = `
@keyframes badgeGlow {
  0% { filter: drop-shadow(0 0 5px currentColor); }
  50% { filter: drop-shadow(0 0 20px currentColor) drop-shadow(0 0 40px currentColor); }
  100% { filter: drop-shadow(0 0 10px currentColor); }
}
`;
document.head.appendChild(style);

console.log('✅ Efectos premium para badges cargados');
