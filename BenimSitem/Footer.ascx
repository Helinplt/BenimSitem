<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="BenimSitem.Footer" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<style>
  /* ===== Base ===== */
  footer{
    border-top:1px solid rgba(255,255,255,.08);
    margin-top:60px;
    background: linear-gradient(180deg,#0c1334,#0b1020);
    color:#dfe7ff;
    font-family:'Poppins',sans-serif;
  }
  .wrap{ max-width:1200px; margin:0 auto; padding:36px 22px 20px }

  a{ color:#dfe7ff; text-decoration:none }
  a:hover{ text-decoration:underline }

  /* ===== Desktop layout (>= 900px) ===== */
  .grid{
    display:grid;
    grid-template-columns: 1.4fr repeat(4,1fr);
    gap:28px;
    align-items:start;
  }

  .brand-inline{ display:flex; align-items:center; gap:10px; margin-bottom:10px }
  .logo{
    width:36px; height:36px; border-radius:12px;
    background: linear-gradient(90deg,#6a5cff,#a164ff,#ce5bff,#ff6ec7);
    display:flex; align-items:center; justify-content:center; color:#fff; font-weight:700;
    box-shadow:0 6px 18px rgba(255,110,199,.35);
  }
  .lead{ color:#b9c7ff; line-height:1.7; margin:0 0 10px }

  .contact{ display:flex; flex-direction:column; gap:8px; margin:14px 0 6px }
  .contact-item{ display:flex; align-items:center; gap:10px; color:#e8eeff; font-size:14px }
  .pay{ display:flex; flex-wrap:wrap; gap:8px; margin:14px 0 6px }
  .pay span{
    padding:6px 10px; border:1px solid rgba(255,255,255,.08); border-radius:8px;
    background:rgba(255,255,255,.06); font-size:12px; display:inline-flex; gap:6px; align-items:center
  }
  .qrbox{ display:flex; align-items:center; gap:12px; margin:14px 0 }
  .qr{
    width:80px; height:80px; border-radius:8px; background:#111a3d;
    border:1px solid rgba(255,255,255,.12); display:flex; align-items:center; justify-content:center; overflow:hidden
  }
  .qr img{ width:100%; height:100%; object-fit:cover }
  .etbis{ color:#b9c7ff; font-size:13.5px }

  .socials{ display:flex; gap:10px; margin-top:14px; flex-wrap:wrap }
  .soc{
    width:40px; height:40px; border-radius:50%;
    display:grid; place-items:center; line-height:1;
    background:rgba(255,255,255,.06); border:1px solid rgba(255,255,255,.10)
  }

  /* ===== Link section (desktop) ===== */
  .sec h5{
    margin:0 0 10px; color:#ffb020; font-size:15px; font-weight:600; letter-spacing:.2px
  }
  .sec a{ display:block; margin:8px 0; line-height:1.6; opacity:.95 }
  .sec a:hover{ opacity:1 }

  /* ===== Accordion button (normalize) ===== */
  .acc-btn{
    display:none;                /* desktop’ta gizli, ≤899px’de görünecek */
    -webkit-appearance:none; appearance:none;
    width:100%;
    padding:12px 12px;
    border-radius:10px;
    border:1px solid rgba(255,255,255,.08);
    background:rgba(255,255,255,.05);
    color:#fff; font-weight:600; font-size:14px;
    align-items:center; justify-content:space-between;
    cursor:pointer;
  }
  .acc-btn i{ transition:transform .25s ease }
  .acc-panel{ display:block } /* desktop’ta normal akış */

  .credits{
    text-align:center; color:#a9b8ff; padding:14px 22px 28px; font-size:13px; opacity:.85
  }

  /* ===== Tablet (≤899px): 2 kolon, akordeon butonları görünür, paneller AÇIK ===== */
  @media (max-width:899px){
    .grid{ grid-template-columns: 1fr 1fr; gap:20px }
    .brand-inline{ justify-content:flex-start }
    .lead, .contact, .pay, .qrbox, .socials{ text-align:left; justify-content:flex-start }
    .qrbox{ flex-direction:row }

    .acc-btn{ display:flex }
    .sec h5{ display:none } /* başlık yerine buton */
    .acc-panel{
      overflow:hidden;
      transition:max-height .28s ease, opacity .25s ease, padding .2s ease;
      max-height:none; opacity:1; padding:6px 2px 0 2px;  /* AÇIK */
    }
    .acc-list a{
      padding:10px 12px; margin:6px 0;
      border-radius:10px; border:1px solid rgba(255,255,255,.06);
      background:rgba(255,255,255,.045);
    }
  }

  /* ===== Telefon (≤599px): tek kolon, akordeon AÇIK BAŞLAR, sol hizalı ===== */
  @media (max-width:599px){
    .wrap{ padding:28px 16px 16px }
    .grid{ grid-template-columns: 1fr; gap:16px }
    .brand-inline{ justify-content:flex-start }
    .lead, .contact, .pay, .qrbox, .socials{ text-align:left; justify-content:flex-start }
    .qrbox{ flex-direction:row; align-items:flex-start }

    .acc-btn{ display:flex; justify-content:space-between }
    .sec h5{ display:none }
    .acc-panel{
      max-height:none !important; opacity:1 !important; padding:6px 2px 0 2px !important; /* AÇIK */
    }
    .acc-list a{ font-size:14px; text-align:left }
  }

  /* Çok küçük telefonlar */
  @media (max-width:380px){
    .soc{ width:38px; height:38px; font-size:15px }
    .qr{ width:72px; height:72px }
  }
</style>

<footer>
  <div class="wrap">
    <div class="grid">
      <!-- Sol geniş blok -->
      <section>
        <div class="brand-inline">
          <div class="logo">HS</div>
          <strong style="color:#fff">Helin Studio</strong>
        </div>
        <p class="lead">Neon pastel paletle modern, erişilebilir ve hızlı web deneyimleri tasarlıyorum. Kurumsal web, e-ticaret ve özelleştirilmiş yönetim panelleri.</p>

        <div class="contact">
          <div class="contact-item"><i class="fa-solid fa-phone"></i> <a href="tel:02124031922">0212 403 1922</a></div>
          <div class="contact-item"><i class="fa-regular fa-envelope"></i> <a href="mailto:info@helinstudio.com">info@helinstudio.com</a></div>
        </div>

        <div class="pay">
          <span><i class="fa-brands fa-cc-visa"></i> Visa</span>
          <span><i class="fa-brands fa-cc-mastercard"></i> MasterCard</span>
          <span><i class="fa-regular fa-credit-card"></i> Havale/FAST</span>
        </div>

        <div class="qrbox">
          <div class="qr"><img src="/resim/etbis-qr.png" alt="ETBİS QR" onerror="this.parentNode.textContent='QR'"></div>
          <div class="etbis">Helin Studio, T.C. Ticaret Bakanlığı ETBİS’e kayıtlı olarak hizmet verir.</div>
        </div>

        <div class="socials">
          <a class="soc" href="#" aria-label="Facebook"><i class="fa-brands fa-facebook-f"></i></a>
          <a class="soc" href="#" aria-label="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
          <a class="soc" href="#" aria-label="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a>
          <a class="soc" href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
          <a class="soc" href="#" aria-label="YouTube"><i class="fa-brands fa-youtube"></i></a>
        </div>
      </section>

      <!-- Link sütunları (akordeonlu) -->
      <section class="sec">
        <button class="acc-btn" aria-expanded="true">
          <span>Kurumsal</span><i class="fa-solid fa-chevron-down"></i>
        </button>
        <h5>Kurumsal</h5>
        <div class="acc-panel">
          <div class="acc-list">
            <a href="#">Neden Helin Studio?</a>
            <a href="#">Hakkımızda</a>
            <a href="#">Web Site Bayiliği</a>
            <a href="#">Güvenli Alışveriş</a>
            <a href="#">7 Gün İade Garantisi</a>
            <a href="iletisim.aspx">İletişim</a>
          </div>
        </div>
      </section>

      <section class="sec">
        <button class="acc-btn" aria-expanded="true">
          <span>Sözleşmeler</span><i class="fa-solid fa-chevron-down"></i>
        </button>
        <h5>Sözleşmeler</h5>
        <div class="acc-panel">
          <div class="acc-list">
            <a href="#">Satış Sözleşmesi</a>
            <a href="#">Teslimat &amp; İade</a>
            <a href="#">KVKK</a>
            <a href="#">Çerez Politikası</a>
          </div>
        </div>
      </section>

      <section class="sec">
        <button class="acc-btn" aria-expanded="true">
          <span>Blog</span><i class="fa-solid fa-chevron-down"></i>
        </button>
        <h5>Blog</h5>
        <div class="acc-panel">
          <div class="acc-list">
            <a href="#">Blog</a>
            <a href="#">Duyuru</a>
            <a href="#">SEO Yazıları</a>
          </div>
        </div>
      </section>

      <section class="sec">
        <button class="acc-btn" aria-expanded="true">
          <span>Sayfalar</span><i class="fa-solid fa-chevron-down"></i>
        </button>
        <h5>Sayfalar</h5>
        <div class="acc-panel">
          <div class="acc-list">
            <a href="#">Bulut E-Ticaret</a>
            <a href="#">Bağış Modülü</a>
            <a href="#">SEO</a>
            <a href="#">Alan Adı Belgeleri</a>
            <a href="#">Konsept Tasarım</a>
            <a href="#">Web Site Kurulumu</a>
            <a href="#">Web Site Özellikleri</a>
            <a href="#">Referanslar</a>
            <a href="#">Şikayet</a>
            <a href="sss.aspx">Sıkça Sorulanlar</a>
            <a href="#">DNS Adreslerimiz</a>
          </div>
        </div>
      </section>
    </div>
  </div>

  <div class="credits">© 2025 Helin Studio — Tüm hakları saklıdır.</div>
</footer>

<script>
    /* Akordeon: Telefonlarda (≤599px) açık başlar; butonla aç/kapa çalışır */
    (function () {
        const sections = document.querySelectorAll('.sec');

        function setForWidth() {
            const isPhone = window.matchMedia('(max-width: 599px)').matches;
            sections.forEach(sec => {
                const btn = sec.querySelector('.acc-btn');
                const panel = sec.querySelector('.acc-panel');
                if (!btn || !panel) return;

                if (isPhone) {
                    // Telefon: açık başlat
                    btn.setAttribute('aria-expanded', 'true');
                    panel.style.maxHeight = 'none';
                    panel.style.opacity = '1';
                    panel.style.padding = '6px 2px 0 2px';
                } else {
                    // Tablet & desktop: her zaman açık (CSS de zaten açık)
                    btn.setAttribute('aria-expanded', 'true');
                    panel.style.maxHeight = 'none';
                    panel.style.opacity = '1';
                    panel.style.padding = '6px 2px 0 2px';
                }
            });
        }

        function toggle(e) {
            const btn = e.currentTarget;
            const panel = btn.parentElement.querySelector('.acc-panel');
            const isPhone = window.matchMedia('(max-width: 599px)').matches;
            if (!isPhone) return; // tablet/desktop'ta daima açık kalsın

            const expanded = btn.getAttribute('aria-expanded') === 'true';
            if (expanded) {
                btn.setAttribute('aria-expanded', 'false');
                panel.style.maxHeight = '0px';
                panel.style.opacity = '0';
                panel.style.padding = '0';
                btn.querySelector('i')?.style.setProperty('transform', 'rotate(0deg)');
            } else {
                btn.setAttribute('aria-expanded', 'true');
                panel.style.padding = '6px 2px 0 2px';
                panel.style.maxHeight = panel.scrollHeight + 'px';
                panel.style.opacity = '1';
                btn.querySelector('i')?.style.setProperty('transform', 'rotate(180deg)');
            }
        }

        sections.forEach(sec => {
            const btn = sec.querySelector('.acc-btn');
            if (btn) btn.addEventListener('click', toggle);
        });

        setForWidth();
        window.addEventListener('resize', setForWidth);
    })();
</script>
