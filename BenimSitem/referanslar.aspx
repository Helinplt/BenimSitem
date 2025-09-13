<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="referanslar.aspx.cs" Inherits="BenimSitem.referanslar" %>
<%@ Register Src="~/ContactWidget.ascx" TagName="ContactWidget" TagPrefix="uc" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="tr">
<head runat="server">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>
<title>Referanslar</title>

<style>
:root {
  --mor:#7c4dff; --pembe:#ff6ec7; --mavi:#5ec5ff; --lacivert:#0c1b4d; --gece:#0b1020;
  --beyaz:#ffffff; --card:rgba(255,255,255,.08); --border:rgba(255,255,255,.18);
  --shadow:0 10px 30px rgba(12,27,77,.25); --radius:18px;
  --grad-hero:
    radial-gradient(1200px 800px at 10% -10%, rgba(124,77,255,.35), transparent 60%),
    radial-gradient(800px 600px at 90% 0%, rgba(255,110,199,.30), transparent 60%),
    linear-gradient(180deg, #0a0f2a 0%, #0c1334 60%, #101944 100%);
  --grad-cta: linear-gradient(135deg, var(--pembe), var(--mor));
  --muted:#aeb9e8;
}

/* Base */
*{ box-sizing:border-box; }
html,body{ height:100%; }
body{
  margin:0; font-family:'Poppins',system-ui,-apple-system,Segoe UI,Roboto,sans-serif;
  color:#e8ecf7; background:var(--gece); overflow-x:hidden;
}
a{ color:inherit; text-decoration:none; }
:focus-visible{ outline:2px solid color-mix(in oklab, var(--mavi) 75%, white 15%); outline-offset:3px; border-radius:10px; }
.wrap{ max-width:1160px; margin:0 auto; padding:0 20px; }

/* HERO */
.hero{ background:var(--grad-hero); padding:28px 0 20px; box-shadow: inset 0 -1px 0 rgba(255,255,255,.06); }
.breadcrumb{ color:#9fb3ff; font-size:13px; display:flex; align-items:center; gap:8px; opacity:.95; }
.breadcrumb a{ color:#cfe0ff; }
.breadcrumb a:hover{ text-decoration:underline; }
.title{ margin:12px 0 4px; font-size:28px; font-weight:700; color:#eaf0ff; letter-spacing:.2px; }
.sub{ margin:0 0 12px; font-size:14px; color:#cfd7ff; opacity:.95; }

/* Toolbar */
.toolbar{
  margin:14px 0 10px; display:flex; gap:10px; align-items:center; flex-wrap:wrap;
  background:var(--card); border:1px solid var(--border); border-radius:16px; padding:10px; box-shadow:var(--shadow);
}
.chips{ display:flex; gap:8px; flex-wrap:wrap; }
.chip{
  appearance:none; border:1px solid rgba(255,255,255,.14); background:rgba(255,255,255,.06);
  color:#dfe8ff; padding:8px 12px; border-radius:999px; font-size:13px; cursor:pointer;
}
.chip.active{ background:var(--grad-cta); border-color:transparent; color:#fff; box-shadow:0 8px 16px rgba(124,77,255,.28); }
.search{ margin-left:auto; position:relative; min-width:240px; flex:1 1 260px; }
.search i{ position:absolute; left:12px; top:50%; transform:translateY(-50%); color:#9fcfff; }
.search input{
  width:100%; padding:10px 12px 10px 38px; border-radius:12px; border:1px solid rgba(255,255,255,.14);
  background:rgba(255,255,255,.06); color:#fff; font-size:14px; outline:none;
}

/* GRID — sabit kolon sayılarıyla eş genişlik */
.grid{
  display:grid;
  gap:18px;
  align-items:stretch; /* kartları satırda eş yükseklikte tutar */
}
@media (min-width: 1200px){ .grid{ grid-template-columns: repeat(4, 1fr); } }
@media (min-width: 900px) and (max-width:1199px){ .grid{ grid-template-columns: repeat(3, 1fr); } }
@media (min-width: 600px) and (max-width:899px){ .grid{ grid-template-columns: repeat(2, 1fr); } }
@media (max-width: 599px){ .grid{ grid-template-columns: 1fr; } }

/* CARD — tüm kartlar aynı yükseklik */
.card{
  background:var(--card); border:1px solid var(--border); border-radius:20px;
  box-shadow:var(--shadow); overflow:hidden;
  display:flex; flex-direction:column;
  height:320px;                         /* >>> sabit yükseklik (masaüstü) */
  transition:transform .18s ease, box-shadow .2s ease, border-color .2s ease, background .2s ease;
}
.card:hover{ transform:translateY(-2px); border-color:rgba(124,77,255,.35); box-shadow:0 16px 30px rgba(124,77,255,.22); }

/* Başlık sabit yükseklik + ellipsis */
.card-h{
  display:flex; align-items:center; gap:10px;
  padding:14px 16px; border-bottom:1px solid rgba(255,255,255,.10);
  min-height:56px;                      /* >>> aynı başlık yüksekliği */
  font-weight:600; font-size:16px;
}
.card-h span:first-child{
  flex:1; overflow:hidden; white-space:nowrap; text-overflow:ellipsis; /* uzun isim tek satır */
}
.tag{
  margin-left:8px; font-size:12px; color:#bcd3ff; background:rgba(255,255,255,.06);
  border:1px solid rgba(255,255,255,.12); padding:4px 8px; border-radius:999px; flex:0 0 auto;
}

/* İçerik: esnek kolon, alt meta tabana itilir */
.card-c{
  padding:14px 16px;
  display:flex; flex-direction:column; row-gap:12px;
  flex:1 1 auto;                        /* başlık dışındaki alan sabitlenir */
}

/* Logo alanı sabit */
.logo-box{
  height:120px;                         /* >>> aynı logo yüksekliği */
  border-radius:14px; border:1px dashed rgba(255,255,255,.18);
  background:linear-gradient(135deg, rgba(94,197,255,.09), rgba(124,77,255,.09));
  display:flex; align-items:center; justify-content:center; overflow:hidden;
}
.logo-box img{ max-width:80%; max-height:80%; object-fit:contain; filter:drop-shadow(0 6px 10px rgba(0,0,0,.25)); }
.logo-fallback{
  width:56px; height:56px; border-radius:14px; display:grid; place-items:center; font-weight:700;
  background:linear-gradient(135deg, rgba(124,77,255,.45), rgba(94,197,255,.45)); color:#fff;
}

/* Spacer (gerekirse açıklama) */
.desc{ font-size:12.5px; color:var(--muted); line-height:1.35; }

/* Meta tabanda */
.meta{
  margin-top:auto;                      /* >>> tabana oturt */
  display:flex; align-items:center; justify-content:space-between;
  font-size:12.5px; color:#aeb9e8;
}
.actions{ display:flex; gap:8px; }
.btn{
  display:inline-flex; align-items:center; gap:8px;
  padding:9px 12px; font-size:13px; font-weight:700; border-radius:10px; border:0; cursor:pointer;
  background:var(--grad-cta); color:#fff; box-shadow:0 10px 20px rgba(124,77,255,.28);
}

/* Boş durum */
.strip{
  margin:8px 0 28px; padding:12px 14px; text-align:center; border-radius:14px;
  background:linear-gradient(90deg, rgba(94,197,255,.18), rgba(124,77,255,.18));
  border:1px solid rgba(255,255,255,.16);
  display:none;
}

/* Responsive kart yüksekliği */
@media (max-width: 599px){
  .card{ height:300px; }                /* telefonlarda biraz kısa */
}

/* Güvenli alan */
@supports(padding:max(env(safe-area-inset-left),0px)){
  .wrap{ padding-left:max(16px, env(safe-area-inset-left)); padding-right:max(16px, env(safe-area-inset-right)); }
}
@media (prefers-reduced-motion: reduce){ .card, .btn{ transition:none !important; } }
</style>
</head>

<body>
  <uc:Header ID="Header1" runat="server" />

  <form id="form1" runat="server">
    <!-- HERO -->
    <section class="hero">
      <div class="wrap">
        <nav class="breadcrumb" aria-label="Breadcrumb">
          <a href="anasayfa.aspx">Ana Sayfa</a>
          <i class="fa-solid fa-chevron-right" style="font-size:11px;opacity:.8"></i>
          <span>Referanslar</span>
        </nav>
        <h1 class="title"><i class="fa-solid fa-award" style="color:#9fcfff"></i> Referanslarımız</h1>
        <p class="sub">Hepsi aynı boy ve hizada: filtrele ya da ara.</p>

        <!-- Filtre / Arama -->
        <div class="toolbar" role="toolbar" aria-label="Referans filtreleri">
          <div class="chips" id="chips">
            <button type="button" class="chip active" data-cat="all" aria-pressed="true">Tümü</button>
            <button type="button" class="chip" data-cat="eticaret">E-Ticaret</button>
            <button type="button" class="chip" data-cat="saas">SaaS</button>
            <button type="button" class="chip" data-cat="kurumsal">Kurumsal</button>
            <button type="button" class="chip" data-cat="egitim">Eğitim</button>
            <button type="button" class="chip" data-cat="saglik">Sağlık</button>
            <button type="button" class="chip" data-cat="kamu">Kamu</button>
          </div>
          <div class="search">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input id="refSearch" type="search" placeholder="İsimle ara (örn: Atlas, Nova)"/>
          </div>
        </div>
      </div>
    </section>

    <!-- CONTENT -->
    <section style="padding:18px 0 30px">
      <div class="wrap">
        <div id="grid" class="grid" aria-live="polite">
          <!-- Kartlar (tamamen aynı iskelet) -->
          <article class="card" data-cat="eticaret" data-name="Atlas Market">
            <div class="card-h">
              <span>Atlas Market</span><span class="tag">E-Ticaret</span>
            </div>
            <div class="card-c">
              <div class="logo-box"><div class="logo-fallback">AM</div></div>
              <div class="desc">Headless storefront • Next.js</div>
              <div class="meta"><span>2024 • TR</span><div class="actions"><a class="btn" href="#">Gör</a></div></div>
            </div>
          </article>

          <article class="card" data-cat="saas" data-name="Nova CRM">
            <div class="card-h"><span>Nova CRM</span><span class="tag">SaaS</span></div>
            <div class="card-c">
              <div class="logo-box"><div class="logo-fallback">NC</div></div>
              <div class="desc">CRM • Çoklu dil</div>
              <div class="meta"><span>2023 • TR</span><div class="actions"><a class="btn" href="#">Gör</a></div></div>
            </div>
          </article>

          <article class="card" data-cat="kurumsal" data-name="Mavi Enerji">
            <div class="card-h"><span>Mavi Enerji</span><span class="tag">Kurumsal</span></div>
            <div class="card-c">
              <div class="logo-box"><div class="logo-fallback">ME</div></div>
              <div class="desc">Kurumsal site</div>
              <div class="meta"><span>2024 • TR</span><div class="actions"><a class="btn" href="#">Gör</a></div></div>
            </div>
          </article>

          <article class="card" data-cat="egitim" data-name="EduPlus">
            <div class="card-h"><span>EduPlus</span><span class="tag">Eğitim</span></div>
            <div class="card-c">
              <div class="logo-box"><div class="logo-fallback">EP</div></div>
              <div class="desc">LMS entegrasyon</div>
              <div class="meta"><span>2022 • TR</span><div class="actions"><a class="btn" href="#">Gör</a></div></div>
            </div>
          </article>

          <article class="card" data-cat="saglik" data-name="SağlıkNet">
            <div class="card-h"><span>SağlıkNet</span><span class="tag">Sağlık</span></div>
            <div class="card-c">
              <div class="logo-box"><div class="logo-fallback">SN</div></div>
              <div class="desc">Randevu modülü</div>
              <div class="meta"><span>2024 • TR</span><div class="actions"><a class="btn" href="#">Gör</a></div></div>
            </div>
          </article>

          <article class="card" data-cat="kamu" data-name="İstanbul Kent">
            <div class="card-h"><span>İstanbul Kent</span><span class="tag">Kamu</span></div>
            <div class="card-c">
              <div class="logo-box"><div class="logo-fallback">İK</div></div>
              <div class="desc">e-Devlet entegrasyon</div>
              <div class="meta"><span>2023 • TR</span><div class="actions"><a class="btn" href="#">Gör</a></div></div>
            </div>
          </article>

          <article class="card" data-cat="eticaret" data-name="RapidShop">
            <div class="card-h"><span>RapidShop</span><span class="tag">E-Ticaret</span></div>
            <div class="card-c">
              <div class="logo-box"><div class="logo-fallback">RS</div></div>
              <div class="desc">Stripe • SEO</div>
              <div class="meta"><span>2022 • TR</span><div class="actions"><a class="btn" href="#">Gör</a></div></div>
            </div>
          </article>

          <article class="card" data-cat="saas" data-name="FlowDesk">
            <div class="card-h"><span>FlowDesk</span><span class="tag">SaaS</span></div>
            <div class="card-c">
              <div class="logo-box"><div class="logo-fallback">FD</div></div>
              <div class="desc">Dashboard • API</div>
              <div class="meta"><span>2021 • TR</span><div class="actions"><a class="btn" href="#">Gör</a></div></div>
            </div>
          </article>

          <article class="card" data-cat="kurumsal" data-name="Akdeniz Lojistik">
            <div class="card-h"><span>Akdeniz Lojistik</span><span class="tag">Kurumsal</span></div>
            <div class="card-c">
              <div class="logo-box"><div class="logo-fallback">AL</div></div>
              <div class="desc">Kurumsal portal</div>
              <div class="meta"><span>2020 • TR</span><div class="actions"><a class="btn" href="#">Gör</a></div></div>
            </div>
          </article>
        </div>

        <div id="empty" class="strip">Sonuç bulunamadı. Filtreleri değiştir veya aramayı temizle.</div>
      </div>
    </section>
  </form>

  <uc:ContactWidget ID="ContactWidget1" runat="server" />
  <uc:Footer ID="Footer1" runat="server" />

<script>
    (function () {
        const chips = document.getElementById('chips');
        const search = document.getElementById('refSearch');
        const grid = document.getElementById('grid');
        const empty = document.getElementById('empty');

        let activeCat = 'all';
        const tr = s => (s || '').toLocaleLowerCase('tr-TR');

        function apply() {
            const q = tr(search.value).trim();
            let shown = 0;
            grid.querySelectorAll('.card').forEach(card => {
                const cat = card.getAttribute('data-cat');
                const name = tr(card.getAttribute('data-name'));
                const catOk = (activeCat === 'all' || activeCat === cat);
                const textOk = (q === '' || name.includes(q));
                const ok = catOk && textOk;
                card.style.display = ok ? '' : 'none';
                if (ok) shown++;
            });
            empty.style.display = shown ? 'none' : 'block';
        }

        chips.addEventListener('click', (e) => {
            const b = e.target.closest('.chip');
            if (!b) return;
            chips.querySelectorAll('.chip').forEach(c => {
                c.classList.remove('active');
                c.setAttribute('aria-pressed', 'false');
            });
            b.classList.add('active');
            b.setAttribute('aria-pressed', 'true');
            activeCat = b.getAttribute('data-cat');
            apply();
        });

        search.addEventListener('input', apply);
        apply();
    })();
</script>
</body>
</html>
