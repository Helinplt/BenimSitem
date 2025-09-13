<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="topbar.ascx.cs" Inherits="BenimSitem.topbar" %>

<style>
  .topbar{
    grid-area:topbar;
    display:flex; align-items:center; gap:12px;
    padding:10px 16px; background:linear-gradient(180deg,#0e1533,#0b1020);
    position:sticky; top:0; z-index:5; border-bottom:1px solid var(--border);
  }
  .burger{ display:none; width:38px;height:38px;border:1px solid var(--border);border-radius:10px;
    align-items:center;justify-content:center; background:rgba(255,255,255,.04); cursor:pointer; color:#eaf0ff;}
  .search{ flex:1; display:flex; gap:8px; align-items:center; background:rgba(255,255,255,.04); border:1px solid var(--border); border-radius:12px; padding:8px 10px; color:#eaf0ff}
  .search input{ flex:1; background:transparent; border:none; outline:none; color:#eaf0ff}
  .top-actions{ display:flex; align-items:center; gap:10px}
  .btn-ghost{ width:38px;height:38px;border:1px solid var(--border);border-radius:10px;display:flex;align-items:center;justify-content:center;background:rgba(255,255,255,.04); cursor:pointer; color:#eaf0ff; position:relative;}
  .badge{ position:absolute; top:-6px; right:-6px; background:linear-gradient(90deg,#ff7ab6,#ffc071); color:#111; font-size:11px; border-radius:999px; padding:2px 6px; font-weight:700; border:2px solid #0b1020;}
  .profile{ display:flex; align-items:center; gap:10px; padding:6px 10px; border:1px solid var(--border); border-radius:12px; background:rgba(255,255,255,.04); cursor:pointer; position:relative; color:#eaf0ff}
  .profile .avatar{ width:34px;height:34px;border-radius:10px;background:linear-gradient(135deg,#6ea8fe,#ad91ff); display:flex;align-items:center;justify-content:center;font-weight:700;color:#0b1020}
  .dropdown{ position:absolute; right:0; top:52px; background:#0f1630; border:1px solid var(--border); border-radius:12px; min-width:220px; display:none; }
  .dropdown a{ display:block; color:#eaf0ff; text-decoration:none; padding:10px 12px; font-size:14px}
  .dropdown a:hover{ background:rgba(255,255,255,.05)}
  @media (max-width:900px){ .burger{ display:flex } }
</style>

<header class="topbar">
  <button class="burger" id="btnBurger" type="button" title="Menü"><i class="fa-solid fa-bars"></i></button>

  <div class="search">
    <i class="fa-solid fa-magnifying-glass" style="opacity:.8"></i>
    <input id="txtSearch" type="search" placeholder="Panelde ara... (kullanıcı, sayfa, dosya)" />
  </div>

  <div class="top-actions">
    <button class="btn-ghost" id="btnNotify" type="button" aria-haspopup="true" aria-expanded="false">
      <i class="fa-regular fa-bell"></i>
      <span class="badge" id="notifCount">3</span>
    </button>

    <div class="profile" id="profileBtn" aria-haspopup="true" aria-expanded="false">
      <div class="avatar" id="avatarInitial">H</div>
      <div class="who">
        <div style="font-size:14px;font-weight:600" id="userName">Helin Polat</div>
        <div style="font-size:12px;opacity:.8" id="userRole">Admin</div>
      </div>
      <i class="fa-solid fa-chevron-down" style="opacity:.8"></i>

      <div class="dropdown" id="profileMenu">
        <a href="profil.aspx"><i class="fa-regular fa-id-badge"></i> Profilim</a>
        <a href="ayarlar.aspx"><i class="fa-solid fa-sliders"></i> Ayarlar</a>
        <a href="sifre-degistir.aspx"><i class="fa-solid fa-key"></i> Şifre Değiştir</a>
        <a href="cikis.aspx"><i class="fa-solid fa-right-from-bracket"></i> Çıkış</a>
      </div>
    </div>
  </div>
</header>

<script>
  // Burger tıklanınca sidebar'a custom event gönder
  document.getElementById('btnBurger')?.addEventListener('click', ()=>{
    window.dispatchEvent(new CustomEvent('toggleSidebar'));
  });

  // Bildirim örneği (yer tutucu)
  document.getElementById('btnNotify')?.addEventListener('click',()=>{
    alert('3 yeni bildirim var. (İleride dropdowna çevirebiliriz.)');
  });

  // Profil menüsü
  const profileBtn = document.getElementById('profileBtn');
  const profileMenu = document.getElementById('profileMenu');
  profileBtn && profileBtn.addEventListener('click',(e)=>{
    e.stopPropagation();
    const open = profileMenu.style.display==='block';
    profileMenu.style.display = open ? 'none' : 'block';
  });
    document.addEventListener('click', () => { if (profileMenu) profileMenu.style.display = 'none'; });



    // Mobile burger
    const burger = document.getElementById('burger');
    const sidebar = document.getElementById('sidebar');
    burger && burger.addEventListener('click', () => sidebar.classList.toggle('open'));

    // Profile dropdown
    const profileBtn = document.getElementById('profileBtn');
    const profileMenu = document.getElementById('profileMenu');
    profileBtn && profileBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        const open = profileMenu.style.display === 'block';
        profileMenu.style.display = open ? 'none' : 'block';
    });
    document.addEventListener('click', () => { if (profileMenu) profileMenu.style.display = 'none'; });

    // (Opsiyonel) Bildirim butonu ileride dropdown'a dönüşebilir
    document.getElementById('btnNotify')?.addEventListener('click', () => {
        alert('3 yeni bildirim var. (Burayı dropdown olarak tasarlayabiliriz.)');
    });
</script>


