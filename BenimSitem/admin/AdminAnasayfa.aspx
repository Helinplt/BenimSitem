<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAnasayfa.aspx.cs" Inherits="BenimSitem.admin.AdminAnasayfa" %>
<!DOCTYPE html>
<html lang="tr">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Admin Paneli | Ana Sayfa</title>

  <!-- Fonts & Icons -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
    :root{
      --bg:#0b1020;          /* koyu lacivert arka plan */
      --bg-soft:#0f1630;     /* panel arkası */
      --card:#121a3a;        /* kartlar */
      --muted:#a9b8ff;       /* ikincil metin */
      --text:#eaf0ff;        /* birincil metin */
      --brand:#6ea8fe;       /* marka vurgusu */
      --brand2:#ad91ff;      /* gradient ikinci renk */
      --ok:#10b981;
      --warn:#f59e0b;
      --danger:#ef4444;
      --border:rgba(255,255,255,.08);
      --shadow:0 18px 40px rgba(12,27,77,.25);
      --radius:16px;
    }
    *{box-sizing:border-box}
    html,body{height:100%}
    body{
      margin:0;
      font-family:Poppins,system-ui,-apple-system,Segoe UI,Roboto,Arial;
      background:linear-gradient(180deg,#0b1020,#0c1334);
      color:var(--text);
    }

    /* Layout */
    .layout{
      display:grid;
      grid-template-columns: 280px 1fr;
      grid-template-rows: 64px 1fr;
      grid-template-areas:
        "sidebar topbar"
        "sidebar main";
      min-height:100vh;
    }
    /* Sidebar */
    .sidebar{
      grid-area:sidebar;
      background:linear-gradient(180deg,#0c1230,#0b1020);
      border-right:1px solid var(--border);
      padding:18px 14px;
      position:sticky; top:0; height:100vh;
      overflow:auto;
    }
    .brand{
      display:flex; align-items:center; gap:10px; padding:4px 8px 16px;
      border-bottom:1px solid var(--border); margin-bottom:14px;
    }
    .logo{
      width:42px;height:42px;border:2px solid #fff;border-radius:12px;
      display:flex;align-items:center;justify-content:center;font-weight:700;letter-spacing:.5px
    }
    .brand strong{font-size:18px}
    .nav{
      display:flex; flex-direction:column; gap:6px;
      margin-top:10px;
    }
    .nav a, .nav button.nav-drop{
      width:100%; text-align:left; background:transparent; color:var(--text);
      border:1px solid transparent; border-radius:12px; padding:10px 12px; display:flex; align-items:center; gap:10px;
      cursor:pointer; text-decoration:none; opacity:.95;
    }
    .nav a:hover, .nav button.nav-drop:hover{background:rgba(255,255,255,.04); border-color:var(--border)}
    .nav .active{background:linear-gradient(90deg,rgba(110,168,254,.18),rgba(173,145,255,.14)); border-color:var(--border)}
    .nav .chev{margin-left:auto; opacity:.8}
    .submenu{
      display:none; padding-left:10px;
    }
    .submenu a{padding:10px 12px 10px 36px; font-size:14px; opacity:.9}

    /* Topbar */
    .topbar{
      grid-area:topbar;
      display:flex; align-items:center; gap:12px;
      padding:10px 16px; background:linear-gradient(180deg,#0e1533,#0b1020);
      position:sticky; top:0; z-index:5; border-bottom:1px solid var(--border);
    }
    .burger{
      display:none; width:38px;height:38px;border:1px solid var(--border);border-radius:10px;
      align-items:center;justify-content:center; background:rgba(255,255,255,.04); cursor:pointer;
    }
    .search{
      flex:1; display:flex; gap:8px; align-items:center;
      background:rgba(255,255,255,.04); border:1px solid var(--border); border-radius:12px; padding:8px 10px;
    }
    .search input{
      flex:1; background:transparent; border:none; outline:none; color:var(--text)
    }
    .top-actions{display:flex; align-items:center; gap:10px}
    .btn-ghost{
      width:38px;height:38px;border:1px solid var(--border);border-radius:10px;display:flex;align-items:center;justify-content:center;
      background:rgba(255,255,255,.04); cursor:pointer; position:relative;
    }
    .badge{
      position:absolute; top:-6px; right:-6px; background:linear-gradient(90deg,#ff7ab6,#ffc071);
      color:#111; font-size:11px; border-radius:999px; padding:2px 6px; font-weight:700; border:2px solid #0b1020;
    }
    .profile{
      display:flex; align-items:center; gap:10px; padding:6px 10px; border:1px solid var(--border); border-radius:12px;
      background:rgba(255,255,255,.04); cursor:pointer; position:relative;
    }
    .profile .avatar{
      width:34px;height:34px;border-radius:10px;background:linear-gradient(135deg,#6ea8fe,#ad91ff);
      display:flex;align-items:center;justify-content:center;font-weight:700;color:#0b1020
    }
    .dropdown{position:absolute; right:0; top:52px; background:var(--bg-soft); border:1px solid var(--border); border-radius:12px; box-shadow:var(--shadow); min-width:220px; display:none}
    .dropdown a{display:block; color:var(--text); text-decoration:none; padding:10px 12px; font-size:14px}
    .dropdown a:hover{background:rgba(255,255,255,.05)}

    /* Main */
    .main{
      grid-area:main; padding:18px 18px 32px;
    }
    .welcome{
      display:flex; align-items:center; justify-content:space-between;
      background: linear-gradient(90deg, rgba(110,168,254,.14), rgba(173,145,255,.12));
      border:1px solid var(--border); border-radius:var(--radius); padding:18px; margin-bottom:16px;
    }
    .welcome h2{margin:0;font-size:22px}
    .welcome p{margin:6px 0 0; color:var(--muted); font-size:14px}
    .cta{
      display:inline-flex; align-items:center; gap:8px; padding:10px 14px;
      border-radius:12px; text-decoration:none; color:#0b1020; font-weight:600;
      background:linear-gradient(135deg,#6ea8fe,#ad91ff); border:1px solid rgba(255,255,255,.22)
    }

    /* Stats */
    .stats{
      display:grid; grid-template-columns: repeat(4, 1fr); gap:14px; margin-bottom:16px;
    }
    .card{
      background:var(--card); border:1px solid var(--border); border-radius:var(--radius); padding:16px; box-shadow:var(--shadow);
    }
    .stat{
      display:flex; align-items:center; gap:12px;
    }
    .stat .ico{
      width:42px;height:42px;border-radius:12px;display:flex;align-items:center;justify-content:center;
      background:rgba(255,255,255,.06); border:1px solid var(--border); font-size:18px
    }
    .stat .val{font-size:22px;font-weight:700}
    .stat .lbl{font-size:12px;color:var(--muted)}

    /* Grids */
    .grid{
      display:grid; grid-template-columns: 1.2fr .8fr; gap:14px;
    }
    .chart-placeholder{
      height:280px; border:1px dashed rgba(255,255,255,.14); border-radius:12px;
      display:flex; align-items:center; justify-content:center; color:var(--muted);
      background:linear-gradient(180deg,rgba(255,255,255,.02),rgba(255,255,255,.01));
    }
    table{width:100%; border-collapse:collapse; font-size:14px}
    th,td{padding:10px 8px; border-bottom:1px solid var(--border)}
    th{color:var(--muted); font-weight:600; text-align:left}

    /* Responsive */
    @media (max-width:1200px){
      .stats{grid-template-columns: repeat(2,1fr)}
      .grid{grid-template-columns:1fr}
    }
    @media (max-width:900px){
      .layout{grid-template-columns: 1fr; grid-template-areas:
        "topbar" "main";}
      .sidebar{position:fixed; z-index:9; left:0; top:0; bottom:0; transform:translateX(-100%); transition:.25s ease; width:280px}
      .sidebar.open{transform:translateX(0)}
      .burger{display:flex}
    }
    /* Nav separator */
.nav-sep{
  height:1px;
  width:100%;
  border:0;
  background: linear-gradient(90deg, rgba(255,255,255,.06), rgba(255,255,255,.12), rgba(255,255,255,.06));
  margin:10px 0;
}

.sidebar {
  grid-area: sidebar;
  background: linear-gradient(180deg,#0c1230,#0b1020);
  border-right: 1px solid var(--border);
  padding: 18px 14px;
  position: sticky;
  top: 0;
  height: 100vh;
  overflow-y: auto;      /* kaydırma aktif */
  overflow-x: hidden;    /* yatay kaydırma kapalı */
}

/* Scroll bar gizleme (Chrome, Edge, Safari) */
.sidebar::-webkit-scrollbar {
  width: 0px;
  background: transparent;
}

/* Firefox */
.sidebar {
  scrollbar-width: none;
}

/* IE ve eski Edge */
.sidebar {
  -ms-overflow-style: none;
}


  </style>
</head>
<body>
  <form id="form1" runat="server">
  <div class="layout">

    <!-- SIDEBAR -->
    <aside class="sidebar" id="sidebar">
      <div class="brand">
        <div class="logo">HS</div>
        <strong>Helin Studio</strong>
      </div>

     <nav class="nav">
  <a class="active" href="AdminAnaSayfa.aspx"><i class="fa-solid fa-gauge-high"></i> Dashboard</a>

  <button class="nav-drop" type="button" data-target="#m1">
    <i class="fa-solid fa-layer-group"></i> İçerikler
    <i class="fa-solid fa-chevron-down chev"></i>
  </button>
  <div class="submenu" id="m1">
    <a href="webduyurular.aspx"><i class="fa-regular fa-bell"></i> Duyurular</a>
    <a href="dosya-ayarlar.aspx"><i class="fa-regular fa-folder-open"></i> Dosya Ayarları</a>
  </div>

  <button class="nav-drop" type="button" data-target="#m2">
    <i class="fa-solid fa-users-gear"></i> Kullanıcılar
    <i class="fa-solid fa-chevron-down chev"></i>
  </button>
  <div class="submenu" id="m2">
    <a href="kullanicilar.aspx"><i class="fa-regular fa-user"></i> Liste</a>
    <a href="webroller.aspx"><i class="fa-solid fa-user-shield"></i> Roller & Yetkiler</a>
  </div>

  <a href="bildirimler.aspx"><i class="fa-regular fa-bell"></i> Bildirimler</a>
  <a href="ayarlar.aspx"><i class="fa-solid fa-sliders"></i> Ayarlar</a>
  <a href="anasayfaweb.aspx"><i class="fa-solid fa-globe"></i> Web Anasayfa</a>
  <a href="yardim.aspx"><i class="fa-regular fa-circle-question"></i> Yardım</a>

  <!-- Çizgi -->
  <hr class="nav-sep" />

  <!-- Yeni: Anasayfa -->
  <button class="nav-drop" type="button" data-target="#mHome">
    <i class="fa-solid fa-house"></i> Anasayfa
    <i class="fa-solid fa-chevron-down chev"></i>
  </button>
  <div class="submenu" id="mHome">
    <a href="anasayfa-banner.aspx"><i class="fa-regular fa-image"></i> Banner / Slider</a>
    <a href="anasayfa-bolumler.aspx"><i class="fa-regular fa-square"></i> Bölümler</a>
    <a href="anasayfa-istatistik.aspx"><i class="fa-solid fa-chart-simple"></i> İstatistik Kartları</a>
    <a href="anasayfa-referanslar.aspx"><i class="fa-regular fa-thumbs-up"></i> Referanslar</a>
    <a href="anasayfa-iletisim.aspx"><i class="fa-regular fa-envelope"></i> İletişim Bloğu</a>
  </div>
</nav>

    </aside>

    <!-- TOPBAR -->
    <header class="topbar">
      <button class="burger" id="burger" type="button"><i class="fa-solid fa-bars"></i></button>

      <div class="search">
        <i class="fa-solid fa-magnifying-glass" style="opacity:.8"></i>
        <input type="search" placeholder="Panelde ara... (kullanıcı, sayfa, dosya)" />
      </div>

      <div class="top-actions">
        <button class="btn-ghost" id="btnNotify" type="button" aria-haspopup="true" aria-expanded="false">
          <i class="fa-regular fa-bell"></i>
          <span class="badge">3</span>
        </button>
        <div class="profile" id="profileBtn" aria-haspopup="true" aria-expanded="false">
          <div class="avatar">H</div>
          <div class="who">
            <div style="font-size:14px;font-weight:600">Helin Polat</div>
            <div style="font-size:12px;color:var(--muted)">Admin</div>
          </div>
          <i class="fa-solid fa-chevron-down" style="opacity:.8"></i>

          <!-- Profile dropdown -->
          <div class="dropdown" id="profileMenu">
            <a href="profil.aspx"><i class="fa-regular fa-id-badge"></i> Profilim</a>
            <a href="ayarlar.aspx"><i class="fa-solid fa-sliders"></i> Ayarlar</a>
            <a href="sifre-degistir.aspx"><i class="fa-solid fa-key"></i> Şifre Değiştir</a>
            <a href="cikis.aspx"><i class="fa-solid fa-right-from-bracket"></i> Çıkış</a>
          </div>
        </div>
      </div>
    </header>

    <!-- MAIN -->
    <main class="main">
      <section class="welcome">
        <div>
          <h2>Hoş geldin, Helin 👋</h2>
          <p>Bugünün özeti: 2 yeni duyuru, 5 başvuru, 1 bekleyen onay.</p>
        </div>
        <a class="cta" href="webduyurular.aspx"><i class="fa-regular fa-square-plus"></i> Yeni Duyuru</a>
      </section>

      <!-- Stats -->
      <section class="stats">
        <div class="card">
          <div class="stat">
            <div class="ico"><i class="fa-solid fa-users"></i></div>
            <div>
              <div class="val">1.284</div>
              <div class="lbl">Toplam Kullanıcı</div>
            </div>
          </div>
        </div>
        <div class="card">
          <div class="stat">
            <div class="ico"><i class="fa-solid fa-chart-line"></i></div>
            <div>
              <div class="val">%98</div>
              <div class="lbl">Uptime (7g)</div>
            </div>
          </div>
        </div>
        <div class="card">
          <div class="stat">
            <div class="ico"><i class="fa-solid fa-file"></i></div>
            <div>
              <div class="val">342</div>
              <div class="lbl">İçerik / Sayfa</div>
            </div>
          </div>
        </div>
        <div class="card">
          <div class="stat">
            <div class="ico"><i class="fa-solid fa-shield-halved"></i></div>
            <div>
              <div class="val">0</div>
              <div class="lbl">Acil Uyarı</div>
            </div>
          </div>
        </div>
      </section>

      <section class="grid">
        <!-- Left: Activity / Chart -->
        <div class="card">
          <h3 style="margin:0 0 12px">Ziyaretçi & Trafik</h3>
          <div class="chart-placeholder">
            <span>Buraya chart gelecek (Recharts / Chart.js / SVG). Şimdilik placeholder.</span>
          </div>
        </div>

        <!-- Right: System -->
        <div class="card">
          <h3 style="margin:0 0 12px">Sistem Durumu</h3>
          <div style="display:grid; gap:10px">
            <div style="display:flex;justify-content:space-between;"><span>API</span> <strong style="color:var(--ok)">Aktif</strong></div>
            <div style="display:flex;justify-content:space-between;"><span>Veritabanı</span> <strong style="color:var(--ok)">Bağlı</strong></div>
            <div style="display:flex;justify-content:space-between;"><span>Depolama</span> <strong>%63</strong></div>
            <div style="display:flex;justify-content:space-between;"><span>CDN</span> <strong style="color:var(--ok)">Hızlı</strong></div>
          </div>
          <hr style="border-color:var(--border); margin:14px 0;">
          <a class="cta" href="adminanasayfa.aspx"><i class="fa-solid fa-arrow-rotate-right"></i> Durumu Yenile</a>
        </div>
      </section>

      <!-- Recent table -->
      <section class="card" style="margin-top:14px;">
        <h3 style="margin:0 0 12px">Son İşlemler</h3>
        <table>
          <thead>
            <tr>
              <th>Tarih</th>
              <th>İşlem</th>
              <th>Kullanıcı</th>
              <th>Durum</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>04.09.2025 18:42</td>
              <td>Yeni duyuru eklendi</td>
              <td>Helin</td>
              <td><span style="color:var(--ok);font-weight:600">Yayınlandı</span></td>
            </tr>
            <tr>
              <td>04.09.2025 17:10</td>
              <td>Kullanıcı yetkisi güncellendi</td>
              <td>Editor-1</td>
              <td><span style="color:var(--warn);font-weight:600">Onay Bekliyor</span></td>
            </tr>
            <tr>
              <td>04.09.2025 15:02</td>
              <td>PDF yüklendi</td>
              <td>Akademisyen-3</td>
              <td><span style="font-weight:600">Tamamlandı</span></td>
            </tr>
          </tbody>
        </table>
      </section>
    </main>

  </div>
  </form>

  <script>
    // Sidebar dropdowns
    document.querySelectorAll('.nav-drop').forEach(btn=>{
      btn.addEventListener('click',()=>{
        const target = document.querySelector(btn.dataset.target);
        const open = target.style.display==='block';
        target.style.display = open ? 'none' : 'block';
        btn.querySelector('.chev').classList.toggle('fa-rotate-180', !open);
      });
    });

    // Mobile burger
    const burger = document.getElementById('burger');
    const sidebar = document.getElementById('sidebar');
    burger && burger.addEventListener('click',()=> sidebar.classList.toggle('open'));

    // Profile dropdown
    const profileBtn = document.getElementById('profileBtn');
    const profileMenu = document.getElementById('profileMenu');
    profileBtn && profileBtn.addEventListener('click',(e)=>{
      e.stopPropagation();
      const open = profileMenu.style.display==='block';
      profileMenu.style.display = open ? 'none' : 'block';
    });
    document.addEventListener('click',()=>{ if(profileMenu) profileMenu.style.display='none'; });

    // (Opsiyonel) Bildirim butonu ileride dropdown'a dönüşebilir
    document.getElementById('btnNotify')?.addEventListener('click',()=>{
      alert('3 yeni bildirim var. (Burayı dropdown olarak tasarlayabiliriz.)');
    });
  </script>
</body>
</html>
