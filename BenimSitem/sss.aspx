<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sss.aspx.cs" Inherits="BenimSitem.sss" %>
<%@ Register Src="~/ContactWidget.ascx" TagName="ContactWidget" TagPrefix="uc" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>
<title>Sıkça Sorulan Sorular</title>

<style>
:root{
  --mor:#7c4dff; --pembe:#ff6ec7; --mavi:#5ec5ff; --lacivert:#0c1b4d; --gece:#0b1020;
  --beyaz:#ffffff; --card:rgba(255,255,255,.08); --border:rgba(255,255,255,.18);
  --shadow:0 10px 30px rgba(12,27,77,.25); --radius:18px; --radius-lg:26px;
  --grad-cta:linear-gradient(135deg, var(--pembe), var(--mor));
  --grad-stroke:linear-gradient(135deg, rgba(255,110,199,.65), rgba(94,197,255,.65));
}

/* Base */
*{ box-sizing:border-box; }
html,body{ height:100%; }
body{
  margin:0; font-family:'Poppins',system-ui,-apple-system,Segoe UI,Roboto,sans-serif;
  color:#e8ecf7; background:var(--gece); overflow-x:hidden;
}
a{ color:inherit; }

/* Wrapper + üst dekor çizgi */
.page-band{
  background:
    radial-gradient(1200px 400px at 10% -10%, rgba(124,77,255,.18), transparent 60%),
    radial-gradient(900px 320px at 90% -20%, rgba(255,110,199,.14), transparent 60%),
    linear-gradient(180deg, #0a0f2a 0%, #0c1334 50%, #101944 100%);
  padding: 16px 0 0;
}
.faq-wrap{ max-width:1100px; margin:18px auto 80px; padding:0 18px; }

/* Breadcrumb / mini başlık */
.breadcrumb{
  display:flex; align-items:center; gap:8px; color:#9fb3ff; font-size:13px; margin:0 0 10px;
  opacity:.9;
}
.breadcrumb a{ color:#bcd3ff; text-decoration:none; }
.breadcrumb a:hover{ text-decoration:underline; }

/* Başlık */
.faq-head{
  position:relative;
  background:var(--card);
  border:1px solid var(--border);
  border-radius:var(--radius);
  box-shadow:var(--shadow);
  padding:22px 24px;
}
.faq-head::after{
  content:""; position:absolute; inset:-1px;
  border-radius:inherit; pointer-events:none;
  background:
    linear-gradient(#0000,#0000) padding-box,
    var(--grad-stroke) border-box;
  -webkit-mask:
    linear-gradient(#000 0 0) padding-box, 
    linear-gradient(#000 0 0) border-box;
  -webkit-mask-composite: xor; mask-composite: exclude;
  border:1px solid transparent;
  opacity:.4;
}
.faq-head h1{
  margin:0; font-size:28px; font-weight:700; color:#eaf0ff; letter-spacing:.2px;
}
.faq-head p{ margin:6px 0 0; font-size:14px; color:#cfd7ff; }

/* Kategori chip’leri (opsiyonel) */
.faq-chips{ margin-top:12px; display:flex; gap:8px; flex-wrap:wrap; }
.faq-chip{
  font-size:12px; padding:6px 10px; border-radius:999px;
  background:rgba(255,255,255,.06); border:1px solid rgba(255,255,255,.15);
  color:#dfe8ff; cursor:default;
}

/* Arama */
.faq-search{
  margin-top:14px; display:flex; gap:10px; align-items:center;
}
.faq-search .input{
  flex:1; position:relative;
  background:rgba(255,255,255,.06);
  border:1px solid rgba(255,255,255,.14);
  border-radius:14px;
  padding:12px 14px 12px 42px;
  color:#fff; outline:none;
  box-shadow: inset 0 0 0 1px rgba(255,255,255,.03);
}
.faq-search .input::placeholder{ color:#aeb9e8; }
.faq-search .icon{
  position:relative; left:36px; color:#9fcfff; pointer-events:none;
}
.faq-search .btn{
  padding:12px 16px; border-radius:12px; border:0; cursor:pointer;
  background:var(--grad-cta); color:#fff; font-weight:700;
  box-shadow:0 8px 20px rgba(124,77,255,.26);
}

/* Kart */
.faq-card{
  margin-top:24px;
  background:var(--card);
  border:1px solid var(--border);
  border-radius:var(--radius);
  box-shadow:var(--shadow);
  padding:10px 10px 6px;
}

/* Liste */
.faq-list{ margin:0; padding:8px; display:grid; gap:12px; }

/* Akordeon kapsayıcı */
.faq-list details{
  background:rgba(255,255,255,.05);
  border:1px solid rgba(255,255,255,.10);
  border-radius:14px;
  overflow:hidden;
  transition: border-color .25s ease, background .25s ease, box-shadow .25s ease;
  will-change: background, border-color, box-shadow;
}
.faq-list details:hover{
  border-color: rgba(124,77,255,.45);
  box-shadow: 0 8px 20px rgba(124,77,255,.18);
}
.faq-list details[open]{
  background: rgba(124,77,255,.08);
  border-color: rgba(124,77,255,.35);
}

/* Başlık (summary) */
.faq-q{
  list-style:none; cursor:pointer; padding:14px 16px;
  display:flex; align-items:center; gap:10px;
  font-weight:600; color:#f5f8ff;
  user-select:none; -webkit-tap-highlight-color:transparent;
}
.faq-q::-webkit-details-marker{ display:none; }

.faq-q .dot{
  width:8px; height:8px; border-radius:50%;
  background:radial-gradient(circle at 30% 30%, #fff, var(--mavi));
  box-shadow:0 0 10px var(--mavi);
  transition: transform .25s ease, box-shadow .25s ease, opacity .25s ease;
}
.faq-list details[open] .dot{
  transform: scale(1.15);
  box-shadow:0 0 16px var(--mavi);
}

.faq-q .title{ flex:1; }
.faq-q .chev{
  width:24px; height:24px; display:grid; place-items:center;
  border-radius:8px; background:rgba(255,255,255,.06);
  border:1px solid rgba(255,255,255,.10);
  transition: transform .28s ease, background .2s ease, border-color .2s ease;
}
.faq-list details[open] .chev{
  transform: rotate(180deg);
  background: rgba(255,255,255,.10);
  border-color: rgba(255,255,255,.16);
}

/* Focus görünürlüğü (klavye erişilebilirliği) */
.faq-q:focus-visible{
  outline: 2px solid color-mix(in oklab, var(--mavi) 70%, white 20%);
  outline-offset: 3px;
  border-radius: 10px;
}

/* Cevap alanı – animasyonlu sarmalayıcı */
.faq-a{ padding: 0 16px 12px 34px; color:#cfd7ff; font-size:14px; }
.faq-a p{ margin:10px 0; line-height:1.7; }
.faq-a .note{ color:#9fcfff; }

.faq-anim{
  /* başlangıç */
  height: 0;
  overflow: hidden;
  opacity: 0;
  transform: translateY(-4px);
  transition: height .35s ease, opacity .25s ease, transform .35s ease;
  will-change: height, opacity, transform;
}
.faq-anim.open{
  /* JS ile height = scrollHeight atanır */
  opacity: 1;
  transform: translateY(0);
}

/* Alt CTA */
.contact-cta{
  margin-top:22px; padding:16px 18px; text-align:center;
  background:rgba(255,255,255,.05);
  border:1px dashed rgba(255,255,255,.18);
  border-radius:14px;
}
.contact-cta a{
  display:inline-block; margin-top:10px; padding:10px 14px; border-radius:12px;
  background:var(--grad-cta); color:#fff; font-weight:700; text-decoration:none;
}

/* Footer */
.faq-footer{
  text-align:center; padding:18px; color:#cfd7ff; font-size:14px;
}


/* ====== (EK) Arama ile ilgili görseller ====== */
.faq-chip{ cursor:pointer; user-select:none; }
.faq-chip.active{
  background: var(--grad-cta);
  color:#fff; border-color: transparent;
  box-shadow: 0 6px 14px rgba(124,77,255,.35);
}
.faq-empty{
  display:none; text-align:center; color:#aeb9e8; padding:14px; font-size:14px;
}
mark.faq-hl{
  background: rgba(94,197,255,.35);
  color:#fff; border-radius:4px; padding:0 .15em;
}


/* =========================
   MOBİL DOSTU DÜZENLEMELER
   (Tablet ve altı)
   ========================= */
@media (max-width: 768px){

  .faq-wrap{
    max-width: 100%;
    padding: 0 clamp(12px, 4vw, 18px);
  }

  .page-band{ padding-top: 10px; }

  /* Başlık bloğu */
  .faq-head{
    padding: 16px;
    border-radius: 16px;
  }
  .faq-head h1{
    font-size: clamp(20px, 5.2vw, 24px);
    line-height: 1.25;
  }
  .faq-head p{
    font-size: 13px;
  }

  /* Breadcrumb */
  .breadcrumb{
    font-size: 12px;
    gap: 6px;
    flex-wrap: wrap;
  }

  /* Chip’ler: yatay kaydırma */
  .faq-chips{
    gap: 6px;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
    scrollbar-width: thin;
    padding-bottom: 4px;
  }
  .faq-chip{ white-space: nowrap; }

  /* ===== Arama BLOĞU – İKON KAYMASI DÜZELTME =====
     Grid ile ikon ve input'u aynı hücreye bindiriyoruz.
     Böylece ikon HER ZAMAN input içinde ortalı kalır. */
  .faq-search{
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: auto auto; /* 1) input+ikon  2) buton */
    gap: 8px;
    width: 100%;
  }
  .faq-search .icon{
    grid-row: 1 / 2;
    grid-column: 1 / 2;
    justify-self: start;
    align-self: center;        /* input yüksekliği ne olursa olsun merkezde */
    margin-left: 14px;         /* soldan mesafe */
    pointer-events: none;
    color: #9fcfff;
    transform: translateY(1px);
  }
  .faq-search .input{
    grid-row: 1 / 2;
    grid-column: 1 / 2;        /* ikonla aynı hücre */
    width: 100%;
    padding: 12px 12px 12px 44px;  /* ikon için sol boşluk */
    font-size: 14px;
    background: rgba(255,255,255,.06);
    border: 1px solid rgba(255,255,255,.14);
    border-radius: 12px;
    color: #fff;
  }
  /* Önceki left:28px stilini etkisiz bırak */
  .faq-search .icon{ left:auto !important; position: static !important; }

  .faq-search .btn{
    grid-row: 2 / 3;
    grid-column: 1 / 2;
    width: 100%;
    padding: 12px 14px;
    font-size: 14px;
    border-radius: 12px;
  }

  /* Kart ve liste boşlukları */
  .faq-card{
    padding: 8px;
    border-radius: 16px;
  }
  .faq-list{
    gap: 10px;
    padding: 6px;
  }

  /* Akordeon ögeleri */
  .faq-list details{
    border-radius: 12px;
  }

  /* Soru satırı (dokunmatik hedefler daha büyük) */
  .faq-q{
    padding: 12px 12px;
    gap: 10px;
    font-size: 15px;
  }
  .faq-q .dot{
    width: 7px; height: 7px;
  }
  .faq-q .chev{
    width: 28px; height: 28px;
    border-radius: 10px;
  }

  /* Cevap alanı */
  .faq-a{
    padding: 0 12px 12px 28px;
    font-size: 13px;
    line-height: 1.65;
  }

  /* Alt CTA */
  .contact-cta{
    padding: 14px;
    font-size: 14px;
  }
  .contact-cta a{
    width: 100%;
    text-align: center;
  }

  /* Footer */
  .faq-footer{ font-size: 13px; }
}

/* =========================
   Küçük telefonlar
   ========================= */
@media (max-width: 480px){

  .faq-head{ padding: 14px; }
  .faq-head h1{ font-size: 19px; }
  .faq-head p{ font-size: 12.5px; }

  .faq-q{
    font-size: 14.5px;
    padding: 11px 10px;
  }
  .faq-a{ font-size: 12.8px; }

  /* Uzun başlıklar taşmasın */
  .faq-q .title{
    word-break: break-word;
  }

  /* Küçük cihazda da grid düzeni korunur; buton tam genişlik */
  .faq-search .btn{
    min-width: 0;
    width: 100%;
  }
}

/* =========================
   Güvenli alan (çentik) boşlukları
   ========================= */
@supports(padding:max(env(safe-area-inset-left),0px)){
  .faq-wrap{
    padding-left: max(16px, env(safe-area-inset-left));
    padding-right: max(16px, env(safe-area-inset-right));
  }
}

/* =========================
   Hareket azaltma tercihi
   ========================= */
@media (prefers-reduced-motion: reduce){
  .faq-list details,
  .faq-q .chev,
  .faq-anim{
    transition: none !important;
  }
}

</style>
</head>

<body>
  <uc:Header ID="Header1" runat="server" />
  <form id="form1" runat="server">

    <div class="page-band">
      <div class="faq-wrap">

        <nav class="breadcrumb" aria-label="breadcrumb">
          <a href="anasayfa.aspx">Ana sayfa</a>
          <i class="fa-solid fa-chevron-right" style="font-size:11px; opacity:.8;"></i>
          <span>Sıkça Sorulan Sorular</span>
        </nav>

        <!-- Başlık + Arama -->
        <div class="faq-head">
          <h1>Sıkça Sorulan Sorular</h1>
          <p>Hızlıca cevap bulun. Bulamazsanız bizimle iletişime geçin.</p>

          <div class="faq-chips" aria-hidden="true">
            <span class="faq-chip">Genel</span>
            <span class="faq-chip">Domain</span>
            <span class="faq-chip">Ödeme</span>
            <span class="faq-chip">Destek</span>
          </div>

          <div class="faq-search">
            <i class="fa-solid fa-magnifying-glass icon"></i>
            <input class="input" type="search" placeholder="Soru ara (örn: domain transfer, ödeme, teslimat)"/>
            <button type="button" class="btn"><i class="fa-solid fa-search"></i> Ara</button>
          </div>
        </div>

        <!-- FAQ Kartı -->
        <div class="faq-card">
          <div class="faq-list">

            <details>
              <summary class="faq-q" role="button" aria-expanded="false">
                <span class="dot"></span>
                <span class="title">Domain kayıt, transfer ve yenileme ücretleri nasıl işliyor?</span>
                <span class="chev"><i class="fa-solid fa-chevron-down"></i></span>
              </summary>
              <div class="faq-a">
                <div class="faq-anim">
                  <p>Fiyatlarımız uzantıya göre değişir ve yıllık olarak hesaplanır. Kayıt esnasında ilk yıl ücreti, transferde mevcut sürenize +1 yıl eklenir, yenilemede mevcut domain sürenize 1 yıl eklenir.</p>
                  <p class="note">Detaylı liste için <a href="domainfiyatlari.aspx">Domain Fiyatları</a> sayfasına bakabilirsiniz.</p>
                </div>
              </div>
            </details>

            <details>
              <summary class="faq-q" role="button" aria-expanded="false">
                <span class="dot"></span>
                <span class="title">Satın aldığım web sitesi bana nasıl teslim ediliyor?</span>
                <span class="chev"><i class="fa-solid fa-chevron-down"></i></span>
              </summary>
              <div class="faq-a">
                <div class="faq-anim">
                  <p>Projeniz kurulum ve temel içeriklerle birlikte canlı ortama taşınır. Veritabanı, admin paneli ve FTP erişim bilgileri güvenli şekilde tarafınıza iletilir. İsteğe bağlı eğitim oturumu yapılır.</p>
                </div>
              </div>
            </details>

            <details>
              <summary class="faq-q" role="button" aria-expanded="false">
                <span class="dot"></span>
                <span class="title">SEO ve Google Ads hizmetlerini nasıl sağlıyorsunuz?</span>
                <span class="chev"><i class="fa-solid fa-chevron-down"></i></span>
              </summary>
              <div class="faq-a">
                <div class="faq-anim">
                  <p>Teknik SEO (hız, semantik HTML, site haritası, yapılandırılmış veri) kurulumunu yapıyor, anahtar kelime analizi ve açılış sayfası optimizasyonu sağlıyoruz. Google Ads için kampanya kurgusu, dönüşüm takibi ve aylık raporlama dahildir.</p>
                </div>
              </div>
            </details>

            <details>
              <summary class="faq-q" role="button" aria-expanded="false">
                <span class="dot"></span>
                <span class="title">Ödeme seçenekleriniz nelerdir?</span>
                <span class="chev"><i class="fa-solid fa-chevron-down"></i></span>
              </summary>
              <div class="faq-a">
                <div class="faq-anim">
                  <p>Kredi/banka kartı, havale/EFT ve kurumsal faturalandırma seçeneklerini destekliyoruz. Taksit imkânları bankanıza göre değişebilir.</p>
                </div>
              </div>
            </details>

            <details>
              <summary class="faq-q" role="button" aria-expanded="false">
                <span class="dot"></span>
                <span class="title">Destek süreciniz nasıl işliyor?</span>
                <span class="chev"><i class="fa-solid fa-chevron-down"></i></span>
              </summary>
              <div class="faq-a">
                <div class="faq-anim">
                  <p>Hafta içi 09:00–18:00 arasında öncelikli e-posta yanıtı sağlıyoruz. Acil durumlar için 7/24 izleme ve kritik müdahale prosedürümüz mevcuttur.</p>
                </div>
              </div>
            </details>

            <details>
              <summary class="faq-q" role="button" aria-expanded="false">
                <span class="dot"></span>
                <span class="title">Verilerim güvende mi?</span>
                <span class="chev"><i class="fa-solid fa-chevron-down"></i></span>
              </summary>
              <div class="faq-a">
                <div class="faq-anim">
                  <p>Sunucularımızda TLS ile şifreleme, düzenli yedekleme ve rol tabanlı erişim politikaları uygulanır. Talep halinde KVKK uyum belgeleri paylaşılabilir.</p>
                </div>
              </div>
            </details>

          </div>
          <!-- (EK) Sonuç yok mesajı yer tutucu -->
          <div class="faq-empty">Aramanıza uygun sonuç bulunamadı.</div>
        </div>

        <div class="contact-cta">
          Aradığınız yanıt yok mu? <br />
          <a href="iletisim.aspx"><i class="fa-regular fa-paper-plane"></i> Bize Ulaşın</a>
        </div>

      

      </div>
    </div>

  </form>
  <uc:ContactWidget ID="ContactWidget1" runat="server" />
  <uc:Footer ID="Footer1" runat="server" />

<!-- === Akordeon Aç/Kapa Animasyonu (JS ile pürüzsüz) === -->
<script>
// details içinde .faq-anim yüksekliğini dinamik ayarla (açılış + kapanış animasyonu)
(function(){
  var prefersReduced = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  document.querySelectorAll('.faq-list details').forEach(function(dt){
    var summary = dt.querySelector('summary');
    var panel   = dt.querySelector('.faq-anim');
    if(!summary || !panel) return;

    // İlk durum için aria-expanded
    summary.setAttribute('aria-expanded', dt.hasAttribute('open') ? 'true' : 'false');

    // Aç/Kapa click
    summary.addEventListener('click', function(ev){
      // native toggle hemen çalışır; biz animasyon için engelleyip kendimiz yönetiyoruz
      ev.preventDefault();
      if(prefersReduced){           // Erişilebilirlik: hareket azalt
        dt.toggleAttribute('open');
        summary.setAttribute('aria-expanded', dt.hasAttribute('open') ? 'true' : 'false');
        return;
      }

      if(!dt.hasAttribute('open')){ // AÇ
        dt.setAttribute('open','');
        summary.setAttribute('aria-expanded', 'true');

        // anlık height 0 -> hedef scrollHeight
        panel.classList.add('open');
        panel.style.height = '0px';
        requestAnimationFrame(function(){
          panel.style.height = panel.scrollHeight + 'px';
        });

        // animasyon bitince auto yap
        panel.addEventListener('transitionend', function te(e){
          if(e.propertyName !== 'height') return;
          panel.style.height = 'auto';
          panel.removeEventListener('transitionend', te);
        });
      }else{                        // KAPA
        // mevcut yükseklikten 0'a
        panel.style.height = panel.scrollHeight + 'px';
        // reflow
        panel.getBoundingClientRect();
        panel.style.height = '0px';
        summary.setAttribute('aria-expanded', 'false');

        panel.addEventListener('transitionend', function tc(e){
          if(e.propertyName !== 'height') return;
          dt.removeAttribute('open');
          panel.classList.remove('open');
          panel.removeEventListener('transitionend', tc);
        });
      }
    });
  });
})();
</script>

<!-- === (EK) Arama + Chip Filtre + Highlight === -->
<script>
    (function () {
        const input = document.querySelector('.faq-search .input');
        const btn = document.querySelector('.faq-search .btn');
        const chips = Array.from(document.querySelectorAll('.faq-chip'));
        const list = document.querySelector('.faq-list');
        const items = Array.from(list.querySelectorAll('details'));
        const empty = document.querySelector('.faq-empty');

        if (!input || !list) return;

        let activeCat = 'tümü'; // 'Genel', 'Domain', 'Ödeme', 'Destek' veya 'tümü'
        const tr = s => (s || '').toLocaleLowerCase('tr-TR');

        // highlight yardımcıları
        function unmark(scope) {
            scope.querySelectorAll('mark.faq-hl').forEach(m => {
                const t = document.createTextNode(m.textContent);
                m.replaceWith(t);
            });
        }
        function mark(el, term) {
            if (!el || !term) { if (el) unmark(el); return; }
            const text = el.textContent;
            const esc = term.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
            el.innerHTML = text.replace(new RegExp(`(${esc})`, 'gi'), '<mark class="faq-hl">$1</mark>');
        }

        // mevcut animasyon fonk. ile uyumlu AÇ
        function openAnim(dt) {
            if (dt.hasAttribute('open')) return;
            const panel = dt.querySelector('.faq-anim');
            dt.setAttribute('open', '');
            if (!panel) return;
            panel.classList.add('open');
            // önce 0'a sabitle
            panel.style.height = '0px';
            // sonra hedef yüksekliğe
            requestAnimationFrame(() => {
                panel.style.height = panel.scrollHeight + 'px';
            });
            panel.addEventListener('transitionend', function te(e) {
                if (e.propertyName !== 'height') return;
                panel.style.height = 'auto';
                panel.removeEventListener('transitionend', te);
            }, { once: true });
        }

        // mevcut animasyon fonk. ile KAPAT (callback ile "display:none" verebilmek için)
        function closeAnim(dt, onClosed) {
            if (!dt.hasAttribute('open')) { if (onClosed) onClosed(); return; }
            const panel = dt.querySelector('.faq-anim');
            if (!panel) { dt.removeAttribute('open'); if (onClosed) onClosed(); return; }

            // eğer height auto ise önce sayısal değere çek
            const current = getComputedStyle(panel).height;
            if (current === 'auto' || panel.style.height === '' || panel.style.height === 'auto') {
                panel.style.height = panel.scrollHeight + 'px';
            }
            // reflow
            panel.getBoundingClientRect();
            // 0'a animasyon
            panel.style.height = '0px';

            panel.addEventListener('transitionend', function tc(e) {
                if (e.propertyName !== 'height') return;
                dt.removeAttribute('open');
                panel.classList.remove('open');
                panel.removeEventListener('transitionend', tc);
                if (onClosed) onClosed();
            }, { once: true });
        }

        function matchCategory(dt) {
            if (activeCat === 'tümü') return true;
            const title = tr(dt.querySelector('.title')?.textContent || '');
            switch (activeCat) {
                case 'genel': return !(title.includes('domain') || title.includes('ödeme') || title.includes('destek'));
                case 'domain': return /domain|alan ?adı|transfer|yenileme/.test(title);
                case 'ödeme': return /ödeme|kart|taksit|fatura/.test(title);
                case 'destek': return /destek|yardım|7\/24|acil/.test(title);
                default: return true;
            }
        }

        function applyFilter(scrollToFirst) {
            const term = tr(input.value).trim();
            let shown = 0, first = null;

            items.forEach(dt => {
                // temizle highlight
                unmark(dt);

                const text = tr(
                    (dt.querySelector('.title')?.textContent || '') + ' ' +
                    (dt.querySelector('.faq-a')?.textContent || '')
                );

                const okCat = matchCategory(dt);
                const okTerm = term === '' || text.includes(term);

                if (okCat && okTerm) {
                    // görünür yap
                    if (dt.style.display === 'none') dt.style.display = '';
                    shown++;
                    if (!first) first = dt;

                    // highlight başlık + içerikte
                    mark(dt.querySelector('.title'), term);
                    mark(dt.querySelector('.faq-a'), term);
                } else {
                    // önce kapat, sonra display:none uygula (aksi halde attribute 'open' takılı kalabilir)
                    closeAnim(dt, () => { dt.style.display = 'none'; });
                }
            });

            if (empty) empty.style.display = shown ? 'none' : 'block';

            // aramada ilkini aç ve görünür yap
            if (term && first) {
                openAnim(first);
                if (scrollToFirst) {
                    first.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }
        }

        // chip olayları
        chips.forEach(ch => {
            ch.addEventListener('click', () => {
                chips.forEach(c => c.classList.remove('active'));
                ch.classList.add('active');
                activeCat = tr(ch.textContent || 'tümü');
                applyFilter(true);
            });
            ch.addEventListener('keydown', e => {
                if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); ch.click(); }
            });
        });

        // input davranışı
        input.addEventListener('input', () => applyFilter(false));
        if (btn) btn.addEventListener('click', () => applyFilter(true));

        // ilk yüklemede hepsini göster
        applyFilter(false);
    })();
</script>

</body>
</html>
