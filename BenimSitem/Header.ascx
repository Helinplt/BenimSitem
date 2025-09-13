<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="BenimSitem.Header" %>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

<style>
  :root{
    --ink-weak:#dfe7ff;
    --grad-cta: linear-gradient(90deg,#6a5cff 0%, #a164ff 35%, #ce5bff 70%, #ff6ec7 100%);
    --grad-header: linear-gradient(180deg, rgba(12,19,52,0.85), rgba(12,19,52,0.55));
  }

  /* ========== TOP BAR ========== */
  .topbar{
    position: sticky; top:0; z-index:4000;
    background: linear-gradient(90deg,#1e3a8a,#4338ca,#6d28d9,#7c3aed);
    background-size:200% 100%; animation: tbshift 14s linear infinite;
    border-bottom:1px solid rgba(255,255,255,.08); color:#e8eeff;
    font-family:'Poppins',sans-serif;
  }
  @keyframes tbshift{0%{background-position:0 0}100%{background-position:200% 0}}
  .tb-inner{ max-width:1200px; margin:0 auto; padding:6px 22px;
    display:grid; grid-template-columns:1fr auto; gap:12px; align-items:center; font-size:12.5px }
  .tb-left{ display:flex; align-items:center; gap:14px; opacity:.95 }
  .tb-left i{ font-size:12px; margin-right:6px; opacity:.9 }
  .tb-right{ display:flex; align-items:center; gap:16px }
  .tb-right a{ color:#f5f7ff; text-decoration:none; opacity:.95 }
  .tb-right a:hover{ opacity:1; text-decoration:underline }
  .tb-dot{ opacity:.35 }
  @media(max-width:900px){ .tb-left{ display:none } .tb-inner{ padding:6px 16px } }


  /* ========== HEADER ========== */
  .header{
    position: sticky; top:36px; z-index:4500;
    backdrop-filter:saturate(140%) blur(8px);
    background: var(--grad-header);
    border-bottom:1px solid rgba(255,255,255,.08);
  }
  .nav{
    max-width:1200px; margin:0 auto; padding:10px 18px;
    display:grid; grid-template-columns:auto 1fr auto; gap:12px; align-items:center;
    font-family:'Poppins',sans-serif;
  }

  .brand{ display:flex; align-items:center; gap:10px; font-weight:700; color:#fff; letter-spacing:.2px; min-width:0 }
  .logo{
    width:30px; height:30px; border-radius:10px; position:relative; isolation:isolate;
    background: var(--grad-cta);
    box-shadow:0 4px 14px rgba(255,110,199,.25);
    display:flex; align-items:center; justify-content:center; color:#fff; font-weight:700; font-size:14px; flex:0 0 auto;
  }
  .logo::after{ content:""; position:absolute; inset:2px; border-radius:8px;
    background:linear-gradient(180deg,rgba(255,255,255,.25),rgba(255,255,255,.02)) }
  .brand-name{
    white-space:nowrap; overflow:hidden; text-overflow:ellipsis; /* dar ekranda taşmasın */
    font-size:16px;
  }

  .menu{ display:flex; justify-content:center; gap:14px }
  .menu a{
    color:var(--ink-weak); text-decoration:none; font-weight:500;
    padding:8px 10px; border-radius:10px; transition:.15s ease;
  }
  .menu a:hover{ background: rgba(255,255,255,0.06) }

  .actions{ display:flex; align-items:center; gap:8px; flex:0 0 auto }
  .btn{
    border:none; cursor:pointer; border-radius:10px; font-weight:600;
    padding:8px 12px; font-size:13.5px; white-space:nowrap;
  }
  .btn.primary{ background: var(--grad-cta); color:#0a0f2a; box-shadow:0 6px 16px rgba(124,77,255,.28) }

  /* ========== HAMBURGER ========== */
  .hamb{
    display:none; width:36px; height:36px; border-radius:8px; margin-left:6px;
    border:1px solid rgba(255,255,255,.10);
    background:rgba(255,255,255,.05); position:relative; cursor:pointer; flex:0 0 auto;
  }
  .hamb span{
    position:absolute; left:8px; right:8px; height:2px; background:#fff; border-radius:2px;
    transition: transform .45s ease, opacity .35s ease;
  }
  .hamb span:nth-child(1){ top:11px }
  .hamb span:nth-child(2){ top:17px }
  .hamb span:nth-child(3){ top:23px }
  body.nav-open .hamb span:nth-child(1){ transform: translateY(6px) rotate(45deg) }
  body.nav-open .hamb span:nth-child(2){ opacity:0 }
  body.nav-open .hamb span:nth-child(3){ transform: translateY(-6px) rotate(-45deg) }

  /* ========== OVERLAY + DRAWER ========== */
  .overlay{
    position:fixed; inset:0; background:rgba(10,14,32,.45); backdrop-filter:blur(1.5px);
    opacity:0; pointer-events:none; transition:opacity .45s ease; z-index:4400;
  }
  body.nav-open .overlay{ opacity:1; pointer-events:auto }

  .mobile-drawer{
    position:fixed; top:0; right:0; height:100dvh; width:min(78vw, 360px);
    background:rgba(14,18,40,.98); border-left:1px solid rgba(255,255,255,.06);
    transform:translateX(100%); transition: transform .45s cubic-bezier(.22,.61,.36,1);
    z-index:4600; display:flex; flex-direction:column; box-shadow:-14px 0 40px rgba(0,0,0,.30)
  }
  body.nav-open .mobile-drawer{ transform:translateX(0) }

  .mobile-head{
    display:flex; align-items:center; justify-content:space-between;
    padding:12px 14px; color:#fff; font-weight:600; border-bottom:1px solid rgba(255,255,255,.06)
  }
  .mobile-menu{ display:flex; flex-direction:column; padding:10px }
  .mobile-menu a{
    color:#dfe7ff; text-decoration:none; padding:10px 12px; border-radius:10px;
    background:rgba(255,255,255,.045); border:1px solid rgba(255,255,255,.06);
    transform:translateX(10px); opacity:0;
  }
  .mobile-menu a + a{ margin-top:8px }
  @keyframes slideIn{ from{opacity:0; transform:translateX(10px)} to{opacity:1; transform:translateX(0)} }
  body.nav-open .mobile-menu a{ animation: slideIn .18s ease forwards }
  body.nav-open .mobile-menu a:nth-child(1){ animation-delay:.05s }
  body.nav-open .mobile-menu a:nth-child(2){ animation-delay:.10s }
  body.nav-open .mobile-menu a:nth-child(3){ animation-delay:.15s }
  body.nav-open .mobile-menu a:nth-child(4){ animation-delay:.20s }
  body.nav-open .mobile-menu a:nth-child(5){ animation-delay:.25s }

  /* Scroll kilidi */
  body.nav-open{ overflow:hidden }

  /* ========== RESPONSIVE (gizleme yok!) ========== */
  @media(max-width:1024px){
    .nav{ padding:12px 18px }
    .menu a{ padding:8px 8px; font-size:14px }
    .btn.primary{ font-size:13px; padding:8px 10px }
    .brand-name{ font-size:15px }
  }
 /* Mobil görünüm düzeni */
@media (max-width: 900px) {
  .menu { display: none; }         /* klasik menü gizlenir */
  .hamb { display: block; }        /* hamburger görünür */
  .actions { justify-content: flex-end; gap: 8px; } /* sağa yasla */
}

  @media(max-width:768px){
    .logo{ width:28px; height:28px; font-size:13px }
    .brand-name{ font-size:14px }
    .mobile-drawer{ width:min(85vw,340px) }
  }
  @media(max-width:480px){
    .nav{ padding:8px 12px; gap:8px }
    .brand-name{ font-size:13px; max-width:40vw } /* taşıp taşmaması kontrol */
    .btn.primary{ font-size:12.5px; padding:6px 10px } /* KÜÇÜLT ama gizleme! */
    .hamb{ width:32px; height:32px }
    .mobile-drawer{ width:100vw }
    .mobile-menu a{ font-size:14px; padding:10px }
  }
</style>

<!-- TOP BAR -->
<div class="topbar">
  <div class="tb-inner">
    <div class="tb-left">
      <span><i class="fa-solid fa-bolt"></i> Neon pastel & hızlı altyapı</span>
      <span><i class="fa-solid fa-shield-heart"></i> Güvenli & mobil uyumlu</span>
    </div>
    <div class="tb-right">
      <a href="sss.aspx"><i class="fa-regular fa-circle-question"></i> Sıkça Sorulanlar</a>
      <span class="tb-dot">•</span>
      <a href="yardim.aspx">Yardım</a>
      <span class="tb-dot">•</span>
      <a href="iletisim.aspx"><i class="fa-regular fa-envelope"></i> İletişim</a>
    </div>
  </div>
</div>

<!-- HEADER -->
<header class="header">
  <div class="nav">
    <div class="brand">
      <div class="logo">HS</div>
      <a href="anasayfa.aspx" class="brand-name">Helin Studio</a> <!-- HİÇBİR EKRANDA GİZLENMEZ -->

    </div>

    <nav class="menu" aria-label="Ana menü">
      <a href="AnaSayfa.aspx">AnaSayfa</a>
      <a href="demositeler.aspx">Hazır Web Siteleri</a>
      <a href="ozellikler.aspx">Özellikler</a>
      <a href="fiyatlar.aspx">Paketler/Fiyatlar</a>
      <a href="referanslar.aspx">Referanslar</a>
    </nav>

    <div class="actions">
      <a class="btn primary" href="musterigirisi.aspx">Müşteri Girişi</a> <!-- HİÇBİR EKRANDA GİZLENMEZ -->
      <button id="hamb" class="hamb" aria-label="Menüyü Aç/Kapat" aria-controls="drawer" aria-expanded="false">
        <span></span><span></span><span></span>
      </button>
    </div>
  </div>
</header>

<!-- OVERLAY -->
<div id="overlay" class="overlay" hidden></div>

<!-- MOBILE DRAWER -->
<aside class="mobile-drawer" id="drawer" role="dialog" aria-modal="true" aria-label="Mobil menü">
  <div class="mobile-head">
    <span>Menü</span>
    <button id="closeDrawer" class="btn" style="padding:6px 10px;background:rgba(255,255,255,.06);border:1px solid rgba(255,255,255,.12);color:#fff">
      Kapat
    </button>
  </div>
  <nav class="mobile-menu" id="mobileMenuLinks">
    <a href="AnaSayfa.aspx">AnaSayfa</a>
    <a href="demositeler.aspx">Hazır Web Siteleri</a>
    <a href="ozellikler.aspx">Özellikler</a>
    <a href="fiyatlar.aspx">Paketler/Fiyatlar</a>
    <a href="referanslar.aspx">Referanslar</a>
  </nav>
</aside>

<script>
    (function () {
        const body = document.body;
        const hamb = document.getElementById('hamb');
        const overlay = document.getElementById('overlay');
        const close = document.getElementById('closeDrawer');
        const links = document.getElementById('mobileMenuLinks');

        function openNav() {
            body.classList.add('nav-open');
            hamb.setAttribute('aria-expanded', 'true');
            overlay.hidden = false;
            const first = links.querySelector('a'); first && first.focus({ preventScroll: true });
        }
        function closeNav() {
            body.classList.remove('nav-open');
            hamb.setAttribute('aria-expanded', 'false');
            setTimeout(() => { overlay.hidden = true; }, 450); // CSS süresiyle uyumlu
            hamb.focus && hamb.focus({ preventScroll: true });
        }

        hamb && hamb.addEventListener('click', () => body.classList.contains('nav-open') ? closeNav() : openNav());
        overlay && overlay.addEventListener('click', closeNav);
        close && close.addEventListener('click', closeNav);
        document.addEventListener('keydown', (e) => { if (e.key === 'Escape' && body.classList.contains('nav-open')) closeNav(); });
        links && links.addEventListener('click', (e) => { if (e.target.tagName === 'A') closeNav(); });
    })();
</script>
