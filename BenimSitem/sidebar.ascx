<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sidebar.ascx.cs" Inherits="BenimSitem.sidebar" %>

<style>
  :root{
    --bg:#0b1020; --bg-soft:#0f1630; --card:#121a3a;
    --muted:#a9b8ff; --text:#eaf0ff; --border:rgba(255,255,255,.08);
  }
  .sidebar{
    grid-area:sidebar;
    background:linear-gradient(180deg,#0c1230,#0b1020);
    border-right:1px solid var(--border);
    padding:18px 14px;
    position:sticky; top:0; height:100vh;
    overflow:auto; width:280px;
    transform:translateX(0); transition:.25s ease;
  }
  .sidebar.hidden{ transform:translateX(-100%); }
  .brand{ display:flex; align-items:center; gap:10px; padding:4px 8px 16px; border-bottom:1px solid var(--border); margin-bottom:14px;}
  .logo{ width:42px;height:42px;border:2px solid #fff;border-radius:12px;display:flex;align-items:center;justify-content:center;font-weight:700;letter-spacing:.5px;color:#fff}
  .brand strong{ color:var(--text); font-size:18px}
  .nav{ display:flex; flex-direction:column; gap:6px; margin-top:10px}
  .nav a,.nav button.nav-drop{
    width:100%; text-align:left; background:transparent; color:var(--text);
    border:1px solid transparent; border-radius:12px; padding:10px 12px; display:flex; align-items:center; gap:10px;
    cursor:pointer; text-decoration:none; opacity:.95;
  }
  .nav a:hover,.nav button.nav-drop:hover{ background:rgba(255,255,255,.04); border-color:var(--border) }
  .nav .active{ background:linear-gradient(90deg,rgba(110,168,254,.18),rgba(173,145,255,.14)); border-color:var(--border) }
  .nav .chev{ margin-left:auto; opacity:.8 }
  .submenu{ display:none; padding-left:10px }
  .submenu a{ padding:10px 12px 10px 36px; font-size:14px; opacity:.9 }
  @media (max-width:900px){ .sidebar{ position:fixed; left:0; top:0; bottom:0; z-index:9; } }
</style>

<aside class="sidebar" id="sidebar">
  <div class="brand">
    <div class="logo">HS</div>
    <strong>Helin Studio</strong>
  </div>

  <nav class="nav" id="sidebarNav">
    <a id="lnkDashboard" href="AdminAnaSayfa.aspx"><i class="fa-solid fa-gauge-high"></i> Dashboard</a>

    <button class="nav-drop" type="button" data-target="#m1"><i class="fa-solid fa-layer-group"></i> İçerikler <i class="fa-solid fa-chevron-down chev"></i></button>
    <div class="submenu" id="m1">
      <a id="lnkDuyurular" href="webduyurular.aspx"><i class="fa-regular fa-bell"></i> Duyurular</a>
      <a id="lnkDosyaAyar" href="dosya-ayarlar.aspx"><i class="fa-regular fa-folder-open"></i> Dosya Ayarları</a>
    </div>

    <button class="nav-drop" type="button" data-target="#m2"><i class="fa-solid fa-users-gear"></i> Kullanıcılar <i class="fa-solid fa-chevron-down chev"></i></button>
    <div class="submenu" id="m2">
      <a id="lnkKullanicilar" href="kullanicilar.aspx"><i class="fa-regular fa-user"></i> Liste</a>
      <a id="lnkRoller" href="webroller.aspx"><i class="fa-solid fa-user-shield"></i> Roller & Yetkiler</a>
    </div>

    <a id="lnkBildirimler" href="bildirimler.aspx"><i class="fa-regular fa-bell"></i> Bildirimler</a>
    <a id="lnkAyarlar" href="ayarlar.aspx"><i class="fa-solid fa-sliders"></i> Ayarlar</a>
    <a id="lnkWeb" href="anasayfaweb.aspx"><i class="fa-solid fa-globe"></i> Web Anasayfa</a>
    <a id="lnkYardim" href="yardim.aspx"><i class="fa-regular fa-circle-question"></i> Yardım</a>
  </nav>
</aside>

<script>
  // Dropdown aç/kapat
  document.currentScript.closest('aside').querySelectorAll('.nav-drop').forEach(btn=>{
    btn.addEventListener('click',()=>{
      const target = document.querySelector(btn.dataset.target);
      const open = target.style.display==='block';
      target.style.display = open ? 'none' : 'block';
      btn.querySelector('.chev').classList.toggle('fa-rotate-180', !open);
    });
  });

  // Topbar'dan gelen "toggleSidebar" custom event
  window.addEventListener('toggleSidebar', ()=>{
    document.getElementById('sidebar').classList.toggle('hidden');
  });


    // Sidebar dropdowns
    document.querySelectorAll('.nav-drop').forEach(btn => {
        btn.addEventListener('click', () => {
            const target = document.querySelector(btn.dataset.target);
            const open = target.style.display === 'block';
            target.style.display = open ? 'none' : 'block';
            btn.querySelector('.chev').classList.toggle('fa-rotate-180', !open);
        });
    });
</script>
