<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yardim.aspx.cs" Inherits="BenimSitem.yardim" %>
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
<title>Yardım Merkezi</title>

<style>
:root{
  --mor:#7c4dff; --pembe:#ff6ec7; --mavi:#5ec5ff; --lacivert:#0c1b4d; --gece:#0b1020;
  --beyaz:#ffffff; --card:rgba(255,255,255,.08); --border:rgba(255,255,255,.18);
  --shadow:0 10px 30px rgba(12,27,77,.25); --radius:18px; --radius-lg:26px;
  --grad-hero:
    radial-gradient(1100px 500px at 8% -10%, rgba(124,77,255,.25), transparent 60%),
    radial-gradient(900px 400px at 92% -20%, rgba(255,110,199,.18), transparent 60%),
    linear-gradient(180deg, #0a0f2a 0%, #0c1334 52%, #101944 100%);
  --grad-cta:linear-gradient(135deg, var(--pembe), var(--mor));
  --grad-stroke:linear-gradient(135deg, rgba(255,110,199,.6), rgba(94,197,255,.6));
}

/* Base */
*{ box-sizing:border-box; }
html,body{ height:100%; }
body{
  margin:0; font-family:'Poppins',system-ui,-apple-system,Segoe UI,Roboto,sans-serif;
  color:#e8ecf7; background:var(--gece); overflow-x:hidden;
}
a{ color:inherit; text-decoration:none; }
a:focus-visible,
button:focus-visible,
input:focus-visible{
  outline:2px solid color-mix(in oklab, var(--mavi) 70%, white 20%);
  outline-offset:2px;
  border-radius:10px;
}

/* HERO */
.hero{
  background:var(--grad-hero);
  padding:28px 0 20px;
  box-shadow: inset 0 -1px 0 rgba(255,255,255,.06);
}
.wrap{ max-width:1160px; margin:0 auto; padding:0 20px; }

.breadcrumb{
  color:#9fb3ff; font-size:13px; display:flex; align-items:center; gap:8px; opacity:.95;
}
.breadcrumb a{ color:#cfe0ff; }
.breadcrumb a:hover{ text-decoration:underline; }

/* Başlık */
.hero-title{
  margin:12px 0 4px; font-size:28px; font-weight:700; letter-spacing:.2px; color:#eaf0ff;
}
.hero-sub{
  margin:0 0 12px; font-size:14px; color:#cfd7ff; opacity:.95;
}

/* Arama kutusu */
.search-box{
  position:relative;
  margin:14px 0 8px;
  background:var(--card);
  border:1px solid var(--border);
  border-radius:16px; box-shadow:var(--shadow);
}
.search-box::after{
  /* gradient stroke */
  content:""; position:absolute; inset:-1px; border-radius:inherit; pointer-events:none;
  background:linear-gradient(#0000,#0000) padding-box, var(--grad-stroke) border-box;
  -webkit-mask:linear-gradient(#000 0 0) padding-box,linear-gradient(#000 0 0) border-box;
  -webkit-mask-composite:xor; mask-composite:exclude;
  border:1px solid transparent; opacity:.35;
}
.search-input{
  width:100%; padding:16px 56px 16px 50px; border:0; outline:0; background:transparent; color:#fff;
  font-size:15px;
}
.search-input::placeholder{ color:#bcd1ff; opacity:.85; }
.search-box .icon{
  position:absolute; left:18px; top:50%; transform:translateY(-50%); color:#9fcfff;
}
.search-box .btn{
  position:absolute; right:10px; top:50%; transform:translateY(-50%);
  width:40px; height:40px; border-radius:12px; border:0; cursor:pointer;
  background:var(--grad-cta); color:#fff; display:grid; place-items:center;
  box-shadow:0 8px 18px rgba(124,77,255,.26);
}

/* GRID */
.grid{
  display:grid; grid-template-columns:repeat(3,1fr); gap:18px; margin:18px 0 28px;
}
.card{
  position:relative;
  background:var(--card); border:1px solid var(--border); border-radius:var(--radius);
  box-shadow:var(--shadow); overflow:hidden; display:flex; flex-direction:column; min-height:280px;
  transition:transform .18s ease, box-shadow .2s ease, border-color .2s ease, background .2s ease;
}
.card::after{
  content:""; position:absolute; inset:-1px; border-radius:inherit; pointer-events:none;
  background:linear-gradient(#0000,#0000) padding-box, var(--grad-stroke) border-box;
  -webkit-mask:linear-gradient(#000 0 0) padding-box,linear-gradient(#000 0 0) border-box;
  -webkit-mask-composite:xor; mask-composite:exclude;
  border:1px solid transparent; opacity:.22; transition:opacity .2s ease;
}
.card:hover{
  transform:translateY(-3px);
  border-color:rgba(124,77,255,.32);
  box-shadow:0 16px 34px rgba(124,77,255,.22);
  background:rgba(255,255,255,.07);
}
.card:hover::after{ opacity:.38; }
.card-h{
  padding:16px 18px; border-bottom:1px solid rgba(255,255,255,.10);
  font-weight:700; font-size:20px; display:flex; align-items:center; gap:10px;
}
.card-h i{ color:var(--mavi); }

.card-c{ padding:0; display:flex; flex-direction:column; height:100%; }
.list{
  margin:0; padding:10px; list-style:none; display:flex; flex-direction:column; gap:6px;
  max-height:260px; overflow:auto;
}
.list::-webkit-scrollbar{ width:10px; }
.list::-webkit-scrollbar-track{ background:rgba(255,255,255,.05); border-radius:10px; }
.list::-webkit-scrollbar-thumb{
  background:linear-gradient(180deg, rgba(94,197,255,.55), rgba(124,77,255,.55));
  border-radius:10px; border:2px solid rgba(0,0,0,.15);
}

.item{
  border:1px solid rgba(255,255,255,.10); border-radius:12px; padding:10px 12px;
  background:rgba(255,255,255,.05);
  transition:background .18s ease, border-color .18s ease, transform .18s ease;
}
.item a{ display:flex; align-items:center; gap:10px; }
.item i{ opacity:.9; }
.item:hover{ background:rgba(124,77,255,.10); border-color:rgba(124,77,255,.38); transform:translateY(-1px); }

.meta{
  padding:8px 12px 12px; font-size:12.5px; color:#aeb9e8; margin-top:auto;
  display:flex; justify-content:space-between; align-items:center;
  border-top:1px dashed rgba(255,255,255,.12);
}

/* Sonuç boş */
.empty{ display:none; text-align:center; color:#aeb9e8; padding:10px; }

/* highlight */
mark.hl{
  background:rgba(94,197,255,.35); color:#fff; border-radius:4px; padding:0 .15em;
}

/* ALT ŞERİT */
.info-strip{
  margin:10px 0 28px; padding:14px 16px; text-align:center;
  background:linear-gradient(90deg, rgba(94,197,255,.18), rgba(124,77,255,.18));
  border:1px solid rgba(255,255,255,.16); border-radius:14px;
}

/* ========== SADECE MOBİL TASARIM ========== */
@media (max-width: 992px){
  .grid{ grid-template-columns:repeat(2,1fr); gap:16px; }
}
@media (max-width: 768px){
  .wrap{ max-width:100%; padding:0 clamp(12px,4vw,18px); }
  .hero{ padding:22px 0 16px; }

  .hero-title{ font-size:24px; margin-top:10px; }
  .hero-sub{ font-size:13px; }

  /* Breadcrumb */
  .breadcrumb{ font-size:12px; gap:6px; flex-wrap:wrap; }

  /* Arama: ikon ve buton hizası düzeltilmiş */
  .search-input{
    padding:14px 56px 14px 46px;  /* solda ikon, sağda buton boşluğu */
    font-size:14px;
  }
  .search-box .icon{
    left:14px;
    top:50%;
    transform:translateY(-50%);
    font-size:16px;
  }
  .search-box .btn{
    right:8px; width:38px; height:38px; border-radius:10px;
  }

  /* Kartlar */
  .card{ min-height:240px; border-radius:16px; }
  .card-h{ padding:14px 14px; font-size:18px; gap:8px; }
  .list{ padding:8px; max-height:220px; gap:6px; }
  .item{ padding:10px 10px; }

  .info-strip{ margin:8px 0 22px; padding:12px 14px; border-radius:12px; font-size:14px; }
}
@media (max-width: 520px){
  .grid{ grid-template-columns:1fr; gap:12px; }
  .search-input{ padding:13px 56px 13px 44px; }
  .search-box .icon{ left:12px; font-size:15px; }
  .search-box .btn{ right:6px; width:40px; height:40px; border-radius:12px; }
}

/* Çentik güvenli alanı */
@supports(padding:max(env(safe-area-inset-left),0px)){
  .wrap{
    padding-left:max(16px, env(safe-area-inset-left));
    padding-right:max(16px, env(safe-area-inset-right));
  }
}

/* Hareket azaltma tercihi */
@media (prefers-reduced-motion: reduce){
  .card, .item{ transition:none !important; }
}
</style>
</head>

<body>
  <uc:Header ID="Header1" runat="server" />
  <form id="form1" runat="server">

    <!-- HERO -->
    <section class="hero">
      <div class="wrap">
        <div class="breadcrumb" aria-label="Breadcrumb">
          <a href="anasayfa.aspx">Ana Sayfa</a>
          <i class="fa-solid fa-chevron-right" style="font-size:11px; opacity:.8;"></i>
          <span>Yardım Merkezi</span>
        </div>

        <h1 class="hero-title"><i class="fa-solid fa-circle-question" style="color:#9fcfff;"></i> Yardım Merkezi</h1>
        <p class="hero-sub">En çok sorulan konulara hızlıca göz at. Yanıt bulamazsan bize yaz, kısa sürede yardımcı olalım.</p>

        <div class="search-box" role="search">
          <i class="fa-solid fa-magnifying-glass icon" aria-hidden="true"></i>
          <input id="helpSearch" class="search-input" type="search"
                 placeholder="Konularda ara (örn: DNS, menü, iade, domain transfer...)"
                 aria-label="Yardım konularında ara"/>
          <button id="helpSearchBtn" type="button" class="btn" aria-label="Ara">
            <i class="fa-solid fa-search"></i>
          </button>
        </div>
      </div>
    </section>

    <!-- CONTENT -->
    <div class="wrap">
      <div id="resultEmpty" class="empty">Aramanıza uygun konu bulunamadı.</div>

      <div id="cards" class="grid">
        <!-- Kart 1 -->
        <section class="card" data-cat="bilesen">
          <div class="card-h"><i class="fa-solid fa-puzzle-piece"></i> Bileşen Yönetimi</div>
          <div class="card-c">
            <ul class="list">
              <li class="item" data-tags="video açıklama bileşeni"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Video / Açıklama Bileşeni</span></a></li>
              <li class="item" data-tags="sayfa bileşeni"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Sayfa Bileşeni</span></a></li>
              <li class="item" data-tags="ürün bileşeni"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Ürün Bileşeni</span></a></li>
              <li class="item" data-tags="resim açıklama"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Resim / Açıklama Bileşeni</span></a></li>
              <li class="item" data-tags="referans logo"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Referans Logo Bileşeni</span></a></li>
            </ul>
            <div class="meta"><span>5 konu</span><a href="sss.aspx">SSS</a></div>
          </div>
        </section>

        <!-- Kart 2 -->
        <section class="card" data-cat="dil">
          <div class="card-h"><i class="fa-solid fa-language"></i> Dil Yönetimi</div>
          <div class="card-c">
            <ul class="list">
              <li class="item" data-tags="yabancı diller çoklu dil"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Yabancı Dilleri Ayarlama</span></a></li>
              <li class="item" data-tags="çeviri tercüme"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Tercümeler / Çeviri Ayarları</span></a></li>
            </ul>
            <div class="meta"><span>2 konu</span><a href="sss.aspx">SSS</a></div>
          </div>
        </section>

        <!-- Kart 3 -->
        <section class="card" data-cat="icerik">
          <div class="card-h"><i class="fa-solid fa-pen-ruler"></i> İçerik Oluşturma</div>
          <div class="card-c">
            <ul class="list">
              <li class="item" data-tags="menü yönetimi"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Menü Yönetimi ve Çalışma Mantığı</span></a></li>
              <li class="item" data-tags="slayt ana sayfa bileşeni"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Ana Sayfa Bileşen ve Slayt Yönetimi</span></a></li>
              <li class="item" data-tags="form sihirbazı sayfalarda kullanım"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Form Sihirbazı ile Form Oluşturma</span></a></li>
              <li class="item" data-tags="ürün ekleme menüde gösterme"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Ürün Ekleme ve Menülerde Gösterme</span></a></li>
            </ul>
            <div class="meta"><span>4 konu</span><a href="sss.aspx">SSS</a></div>
          </div>
        </section>

        <!-- Kart 4 -->
        <section class="card" data-cat="modul">
          <div class="card-h"><i class="fa-solid fa-cubes"></i> Modüller</div>
          <div class="card-c">
            <ul class="list">
              <li class="item" data-tags="whatsapp sipariş modülü"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Whatsapp Sipariş Modülü</span></a></li>
              <li class="item" data-tags="eticaret genel ayarlar"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Eticaret Genel Ayarlar ve Özellikler</span></a></li>
            </ul>
            <div class="meta"><span>2 konu</span><a href="sss.aspx">SSS</a></div>
          </div>
        </section>

        <!-- Kart 5 -->
        <section class="card" data-cat="rehber">
          <div class="card-h"><i class="fa-solid fa-compass-drafting"></i> Rehberler</div>
          <div class="card-c">
            <ul class="list">
              <li class="item" data-tags="google maps api kurulum"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Google Maps API Kurulum Rehberi</span></a></li>
              <li class="item" data-tags="hosts dosyası domain yönlendirme"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Hosts Dosyasını Güncelleme</span></a></li>
            </ul>
            <div class="meta"><span>2 konu</span><a href="sss.aspx">SSS</a></div>
          </div>
        </section>

        <!-- Kart 6 -->
        <section class="card" data-cat="destek">
          <div class="card-h"><i class="fa-solid fa-headset"></i> Destek & İade</div>
          <div class="card-c">
            <ul class="list">
              <li class="item" data-tags="ödeme iade fatura"><a href="#"><i class="fa-solid fa-angle-right"></i><span>Ödeme ve İade Koşulları</span></a></li>
              <li class="item" data-tags="destek saatleri iletişim"><a href="iletisim.aspx"><i class="fa-solid fa-angle-right"></i><span>Destek Süreçleri ve İletişim</span></a></li>
            </ul>
            <div class="meta"><span>2 konu</span><a href="iletisim.aspx">İletişim</a></div>
          </div>
        </section>
      </div>

      <div class="info-strip">
        Aradığını bulamadın mı? <a href="iletisim.aspx" style="font-weight:700; color:#fff; text-decoration:underline;">Bize yaz</a>, en kısa sürede yardımcı olalım.
      </div>
    </div>
  </form>

  <uc:ContactWidget ID="ContactWidget1" runat="server" />
  <uc:Footer ID="Footer1" runat="server" />

<!-- Arama: canlı filtre + highlight -->
<script>
    (function () {
        const input = document.getElementById('helpSearch');
        const btn = document.getElementById('helpSearchBtn');
        const cards = Array.from(document.querySelectorAll('#cards .card'));
        const empty = document.getElementById('resultEmpty');
        const tr = s => (s || '').toLocaleLowerCase('tr-TR');

        function unmark(scope) {
            scope.querySelectorAll('mark.hl').forEach(m => {
                const t = document.createTextNode(m.textContent); m.replaceWith(t);
            });
        }
        function mark(el, term) {
            if (!el || !term) { if (el) unmark(el); return; }
            const text = el.textContent; const esc = term.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
            el.innerHTML = text.replace(new RegExp(`(${esc})`, 'gi'), '<mark class="hl">$1</mark>');
        }

        function apply(scrollFirst) {
            const q = tr(input.value).trim();
            let visibleCards = 0, firstItem = null;

            cards.forEach(card => {
                const items = Array.from(card.querySelectorAll('.item'));
                let showCount = 0;

                items.forEach(li => {
                    const span = li.querySelector('span');
                    unmark(span);
                    const hay = tr(span?.textContent) + ' ' + tr(li.getAttribute('data-tags'));
                    const ok = q === '' || hay.includes(q);
                    li.style.display = ok ? '' : 'none';
                    if (ok) {
                        showCount++;
                        mark(span, q);
                        if (!firstItem) firstItem = li;
                    }
                });

                card.style.display = showCount ? '' : 'none';
                if (showCount) visibleCards++;
            });

            empty.style.display = visibleCards ? 'none' : 'block';
            if (q && firstItem && scrollFirst) {
                firstItem.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        }

        input.addEventListener('input', () => apply(false));
        btn && btn.addEventListener('click', () => apply(true));
        apply(false);
    })();
</script>
</body>
</html>
