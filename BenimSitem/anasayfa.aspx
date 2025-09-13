<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="BenimSitem.anasayfa" %>
<%@ Register Src="~/ContactWidget.ascx" TagName="ContactWidget" TagPrefix="uc" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>


<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Helin Studio — Modern Web Çözümleri</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --mor: #7c4dff; /* mor */
            --pembe: #ff6ec7; /* pembe */
            --mavi: #5ec5ff; /* mavi */
            --lacivert: #0c1b4d; /* lacivert */
            --gece: #0b1020; /* koyu arka plan */
            --acik: #f7f9fc; /* açık arka plan */
            --beyaz: #ffffff;
            --card: rgba(255,255,255,0.08);
            --glass: rgba(255,255,255,0.6);
            --border: rgba(255,255,255,0.18);
            --shadow: 0 10px 30px rgba(12, 27, 77, 0.25);
            --radius: 18px;
            --radius-lg: 26px;
            --grad-hero: radial-gradient(1200px 800px at 10% -10%, rgba(124,77,255,.35), transparent 60%), radial-gradient(800px 600px at 90% 0%, rgba(255,110,199,.30), transparent 60%), radial-gradient(900px 700px at 50% 120%, rgba(94,197,255,.30), transparent 60%), linear-gradient(180deg, #0a0f2a 0%, #0c1334 60%, #101944 100%);
            --grad-cta: linear-gradient(135deg, var(--pembe), var(--mor));
            --grad-stroke: linear-gradient(135deg, rgba(255,110,199,.6), rgba(94,197,255,.6));
        }

        * {
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
        }

        body {
            margin: 0;
            font-family: 'Poppins', system-ui, -apple-system, Segoe UI, Roboto, sans-serif;
            color: #e8ecf7;
            background: var(--gece);
            overflow-x: hidden;
        }

     

        /* ---------- Hero ---------- */
        .hero {
            background: var(--grad-hero);
            position: relative;
            overflow: clip;
        }

        .hero-inner {
            max-width: 1200px;
            margin: 0 auto;
            padding: clamp(56px, 8vw, 120px) 22px;
            display: grid;
            grid-template-columns: 1.15fr 0.85fr;
            gap: 28px;
            align-items: center;
        }

        .kicker {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 6px 12px;
            border-radius: 999px;
            background: rgba(255,255,255,.08);
            border: 1px solid rgba(255,255,255,.15);
            font-weight: 600;
            font-size: .9rem;
        }

            .kicker i {
                color: var(--mavi);
            }

        .hero h1 {
            font-size: clamp(34px, 5vw, 56px);
            line-height: 1.08;
            margin: 16px 0 12px;
            letter-spacing: .2px;
        }

        .hero p.lead {
            color: #cfd9ff;
            font-size: clamp(16px, 2.2vw, 18px);
            opacity: .92;
        }

        .cta-row {
            display: flex;
            gap: 12px;
            margin-top: 22px;
            flex-wrap: wrap;
        }

        .cta {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 14px 18px;
            border-radius: 14px;
            font-weight: 700;
            border: 1px solid transparent;
            text-decoration: none;
        }

            .cta.primary {
                background: var(--grad-cta);
                color: #0b1020;
                box-shadow: var(--shadow);
            }

            .cta.secondary {
                background: rgba(255,255,255,.08);
                color: #fff;
                border-color: rgba(255,255,255,.14);
            }

        .mockup {
            position: relative;
        }

        .glass-card {
            background: linear-gradient(180deg, rgba(255,255,255,.12), rgba(255,255,255,.05));
            border: 1px solid rgba(255,255,255,.2);
            box-shadow: var(--shadow);
            border-radius: var(--radius-lg);
            padding: 22px;
            isolation: isolate;
        }

        .mockup .screen {
            border-radius: 16px;
            aspect-ratio: 16/10;
            background: linear-gradient(135deg, #0f1b4f, #15256a);
            border: 1px solid rgba(255,255,255,.1);
            position: relative;
            overflow: hidden;
        }

        .code {
            position: absolute;
            inset: 0;
            padding: 18px;
            font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
            font-size: 12.5px;
            line-height: 1.5;
            color: #d9e1ff;
            opacity: .9;
        }

        .tag {
            color: #ffb0df;
        }

        .attr {
            color: #8ad7ff;
        }

     


/* <= 768px */
@media (max-width: 768px) {

  .hero-inner{
    grid-template-columns: 1fr;
    gap: 20px;                           
    padding: clamp(24px, 6vw, 40px) 14px;
    text-align: center;
  }

  .kicker{
    font-size: .82rem;
    padding: 6px 10px;
    margin-bottom: 6px;                  
  }

  .hero h1{
    font-size: clamp(24px, 6.6vw, 32px);
    line-height: 1.20;                   
    margin: 8px 0 14px;                  
  }

  .hero p.lead{
    font-size: clamp(14px, 3.3vw, 15.5px);
    opacity: .96;
    margin-bottom: 16px;                 
  }

  /* Butonlar */
  .cta-row{
    margin-top: 6px;
    gap: 12px;                           
    flex-wrap: nowrap;                   
    justify-content: center;
    align-items: center;
  }

  .cta{
    flex: 0 1 168px;                     
    max-width: 180px;                    
    padding: 9px 12px;                   
    border-radius: 9px;
    min-height: 36px;
    font-size: .84rem;                   
    justify-content: center;
  }

  /* İlk buton biraz daha küçük */
  .cta-row .cta:first-child {
    flex: 0 1 150px;   /* genişliği daralttık */
    max-width: 160px;
  }

  .mockup{ order: 2; }
  .glass-card{ border-radius: 14px; padding: 12px; }
  .mockup .screen{ aspect-ratio: 16/10; border-radius: 12px; }

  .code{
    padding: 12px;
    font-size: 12px;
    line-height: 1.45;
    white-space: pre-wrap;
    word-break: break-word;
  }
}

/* <= 480px */
@media (max-width: 480px){

  .hero-inner{
    gap: 16px;
    padding: 22px 12px;
  }

  .hero h1{
    font-size: clamp(22px, 7.8vw, 28px);
    line-height: 1.18;
    margin: 8px 0 12px;                  
  }

  .hero p.lead{
    font-size: 13.5px;
    margin-bottom: 14px;
  }

  .cta-row{
    gap: 10px;
    flex-wrap: wrap;                     
    justify-content: center;
  }

  .cta{
    flex: 1 1 44%;                        
    max-width: none;
    padding: 8px 10px;
    min-height: 34px;
    font-size: .82rem;
  }

  /* İlk buton daha dar olsun */
  .cta-row .cta:first-child {
    flex: 1 1 40%;   /* 44% → 40% */
  }

  .mockup .screen{ aspect-ratio: 3/2; }
  .code{ font-size: 11.5px; padding: 11px; }
}

/* Erişilebilirlik tercihi */
@media (prefers-reduced-motion: reduce){
  *{ animation: none !important; transition: none !important; }
}



        /* ---------- Özellikler Grid ---------- */
        .section {
            padding: clamp(48px, 7vw, 90px) 22px;
        }

        .wrap {
            max-width: 1200px;
            margin: 0 auto;
        }

        .section h2 {
            font-size: clamp(26px, 3.4vw, 36px);
            margin: 0 0 14px;
        }

        .section p.sub {
            color: #cdd7ff;
            margin: 0 0 26px;
        }

        .features {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .feat {
            background: rgba(255,255,255,.06);
            border: 1px solid rgba(255,255,255,.12);
            border-radius: 18px;
            padding: 20px;
            transition: transform .25s ease, box-shadow .25s ease;
        }

            .feat:hover {
                transform: translateY(-6px);
                box-shadow: 0 18px 40px rgba(12,27,77,.35);
            }

            .feat i {
                font-size: 22px;
                padding: 12px;
                border-radius: 12px;
                background: rgba(255,255,255,.08);
                border: 1px solid rgba(255,255,255,.12);
                color: var(--pembe);
            }

            .feat h3 {
                margin: 14px 0 8px;
                font-size: 18px;
                letter-spacing: .2px;
            }

        .chips {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            margin-top: 10px;
        }

        .chip {
            font-size: 12px;
            padding: 6px 10px;
            border-radius: 999px;
            background: rgba(124,77,255,.18);
            color: #e6dcff;
            border: 1px solid rgba(124,77,255,.28);
        }

     /* =========================
   Mobil düzenlemeler (Section/Features)
   ========================= */

/* <= 768px */
@media (max-width: 768px){

  .section{
    padding: clamp(28px, 6.5vw, 40px) 16px;
    text-align: center;
  }

  .wrap{ max-width: 640px; }

  .section h2{
    font-size: clamp(22px, 5.8vw, 28px);
    margin: 0 0 10px;
    text-wrap: balance;
  }

  .section p.sub{
    font-size: clamp(13px, 3.2vw, 14.5px);
    margin: 0 0 18px;
  }

  /* 3 sütundan 2 sütuna geç */
  .features{
    grid-template-columns: repeat(2, 1fr);
    gap: 12px;
  }

  .feat{
    padding: 16px;
    border-radius: 14px;
    transition: transform .18s ease, box-shadow .18s ease;
  }

  .feat:hover{
    transform: translateY(-3px);
    box-shadow: 0 12px 28px rgba(12,27,77,.28);
  }

  .feat i{
    font-size: 18px;
    padding: 10px;
    border-radius: 10px;
  }

  .feat h3{
    margin: 12px 0 6px;
    font-size: 16px;
    letter-spacing: .15px;
  }

  .chips{
    gap: 6px;
    margin-top: 8px;
    justify-content: center;
  }

  .chip{
    font-size: 11.5px;
    padding: 5px 9px;
  }
}

/* <= 480px */
@media (max-width: 480px){

  .section{
    padding: 22px 14px;
  }

  .wrap{ max-width: 420px; }

  .section h2{
    font-size: clamp(20px, 7vw, 24px);
    margin-bottom: 8px;
  }

  .section p.sub{
    font-size: 13px;
    margin-bottom: 16px;
  }

  /* 2 sütundan 1 sütuna düş */
  .features{
    grid-template-columns: 1fr;
    gap: 10px;
  }

  .feat{
    padding: 14px;
    border-radius: 12px;
  }

  .feat i{
    font-size: 17px;
    padding: 9px;
    border-radius: 10px;
  }

  .feat h3{
    font-size: 15px;
    margin: 10px 0 6px;
  }

  .chips{
    gap: 6px;
    margin-top: 6px;
  }

  .chip{
    font-size: 11px;
    padding: 5px 8px;
  }
}

/* Hareket azaltma tercihi */
@media (prefers-reduced-motion: reduce){
  .feat,
  .feat:hover{ transition: none !important; transform: none !important; box-shadow: none !important; }
}


        /* ---------- Sektör Çözümleri (Paket yerine) ---------- */
        .industries {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .card {
            position: relative;
            overflow: hidden;
            border-radius: 18px;
            background: linear-gradient(160deg, rgba(124,77,255,.20), rgba(6,16,54,.9));
            border: 1px solid rgba(255,255,255,.12);
            min-height: 200px;
            padding: 18px;
            transition: transform .25s ease, box-shadow .25s ease;
        }

            .card:hover {
                transform: translateY(-6px);
                box-shadow: 0 18px 40px rgba(124,77,255,.25);
            }

            .card h4 {
                margin: 8px 0 6px;
            }

            .card p {
                color: #cfd7ff;
                opacity: .9;
                font-size: 14px;
            }

        .ribbon {
            position: absolute;
            top: 12px;
            right: 12px;
            background: var(--grad-cta);
            color: #111;
            padding: 6px 10px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
        }

        .tagline {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            margin-top: 12px;
        }

            .tagline span {
                font-size: 12px;
                padding: 6px 10px;
                border-radius: 999px;
                background: rgba(255,255,255,.08);
                border: 1px solid rgba(255,255,255,.16);
            }

        @media (max-width:900px) {
            .industries {
                grid-template-columns: 1fr;
            }
        }

      

        /* ---------- Süreç (3 adım) ---------- */
        .steps {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 18px;
            counter-reset: step;
        }

        .step {
            background: rgba(255,255,255,.06);
            border: 1px solid rgba(255,255,255,.12);
            border-radius: 18px;
            padding: 16px;
            position: relative;
            transition: transform .25s ease, box-shadow .25s ease, border-color .25s ease;
        }

            .step:hover {
                transform: translateY(-6px);
                box-shadow: 0 18px 40px rgba(12,27,77,.35);
                border-color: rgba(255,255,255,.22);
            }

            /* üst sağdaki numara (istersen bırakma) */
            .step::before {
                counter-increment: step;
                content: counter(step);
                position: absolute;
                top: 14px;
                right: 14px;
                width: 34px;
                height: 34px;
                border-radius: 50%;
                display: grid;
                place-items: center;
                background: var(--grad-cta);
                color: #0b1020;
                font-weight: 800;
            }

        /* Görsel alanı */
        .thumb {
            position: relative;
            border-radius: 14px;
            overflow: hidden;
            /* gradient kenarlık */
            padding: 2px;
            background: linear-gradient(135deg, rgba(255,110,199,.5), rgba(94,197,255,.5));
            margin-bottom: 12px;
        }

            .thumb::after {
                content: "";
                position: absolute;
                inset: 0;
                box-shadow: inset 0 -40px 80px rgba(0,0,0,.12); /* hafif alt gölge */
                pointer-events: none;
            }

            .thumb img {
                display: block;
                width: 100%;
                height: 220px; /* kart yüksekliği */
                object-fit: cover;
                border-radius: 12px;
                background: #0e173e; /* görsel yüklenmezse */
            }

        /* Sol üst mini rozet */
        .badge {
            position: absolute;
            left: 10px;
            top: 10px;
            font-size: 12px;
            font-weight: 700;
            padding: 6px 10px;
            border-radius: 999px;
            background: rgba(0,0,0,.35);
            color: #fff;
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255,255,255,.25);
        }

        /* Metin kısmı */
        .step-body h3 {
            margin: 6px 0 6px;
            font-size: 18px;
            letter-spacing: .2px;
        }

        .step-body p {
            color: #cdd7ff;
        }

       /* =========================
   Steps (3 Adım) - Responsive
   ========================= */

/* Tablet ve daha küçük ekranlar (≤992px) */
@media (max-width: 992px) {
  .steps {
    grid-template-columns: repeat(2, 1fr); /* 3 yerine 2 sütun */
    gap: 16px;
  }

  .thumb img {
    height: 200px; /* görsel biraz küçültüldü */
  }

  .step-body h3 {
    font-size: 17px;
  }
}

/* Telefon (≤768px) */
@media (max-width: 768px) {
  .steps {
    grid-template-columns: 1fr; /* her adım tam genişlik */
    gap: 14px;
  }

  .step {
    padding: 14px;
  }

  .thumb img {
    height: 180px;
  }

  .step-body h3 {
    font-size: 16px;
  }

  .step-body p {
    font-size: 14px;
  }
}

/* Küçük telefon (≤576px) */
@media (max-width: 576px) {
  .steps {
    gap: 12px;
  }

  .thumb img {
    height: 160px;
  }

  .badge {
    font-size: 11px;
    padding: 5px 9px;
  }

  .step::before {
    width: 28px;
    height: 28px;
    font-size: 13px;
    top: 10px;
    right: 10px;
  }
}

/* Çok küçük cihazlar (≤400px) */
@media (max-width: 400px) {
  .step {
    padding: 12px;
  }

  .thumb img {
    height: 140px;
  }

  .step-body h3 {
    font-size: 15px;
  }

  .step-body p {
    font-size: 13px;
  }
}


       

        /* ---------- CTA Stripe ---------- */
        .stripe {
            margin-top: 8px;
            border-radius: 20px;
            padding: 24px;
            background: linear-gradient(135deg, rgba(255,110,199,.18), rgba(124,77,255,.18));
            border: 1px solid rgba(255,255,255,.18);
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 14px;
            justify-content: space-between;
        }


    
        /* ---------- Little Animations ---------- */
        .floaty {
            animation: floaty 6s ease-in-out infinite;
        }

        @keyframes floaty {
            0%, 100% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(-8px);
            }
        }


        /* ===== Hepsi Bir Arada Bölümü ===== */
        .features-hero {
            position: relative;
            overflow: clip;
            background: linear-gradient(180deg, rgba(255,255,255,.03), rgba(255,255,255,.02));
            border-top: 1px solid rgba(255,255,255,.06);
            border-bottom: 1px solid rgba(255,255,255,.06);
        }

        /* Başlık */
        .fh-head {
            text-align: center;
            margin-bottom: 18px;
        }

        .fh-kicker {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 6px 12px;
            border-radius: 999px;
            background: rgba(255,255,255,.08);
            border: 1px solid rgba(255,255,255,.15);
            font-weight: 600;
            font-size: .9rem;
        }

        .fh-head h2 {
            font-size: clamp(26px, 3.4vw, 36px);
            margin: 12px 0 10px;
            position: relative;
        }

            .fh-head h2 span {
                background: var(--grad-cta);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
            }
            /* Başlık altına gradient çizgi */
            .fh-head h2::after {
                content: "";
                display: block;
                height: 4px;
                width: 96px;
                margin: 10px auto 0;
                border-radius: 999px;
                background: linear-gradient(135deg, var(--pembe), var(--mavi));
                opacity: .8;
            }

        .fh-head .sub {
            color: #cdd7ff;
        }

        /* Üstteki ikonlu kapsüller */
        .pill-cards {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 16px;
            margin: 18px 0 28px;
        }

        .pill {
            background: rgba(255,255,255,.08);
            border: 1px solid rgba(255,255,255,.14);
            border-radius: 16px;
            padding: 18px 16px;
            text-align: center;
            box-shadow: 0 8px 26px rgba(12,27,77,.18);
            transition: transform .2s ease, box-shadow .2s ease, border-color .2s ease;
        }

            .pill:hover {
                transform: translateY(-6px);
                border-color: rgba(255,255,255,.22);
                box-shadow: 0 18px 40px rgba(12,27,77,.32);
            }

            .pill i {
                font-size: 22px;
                color: var(--mavi);
                background: rgba(255,255,255,.10);
                border: 1px solid rgba(255,255,255,.16);
                width: 44px;
                height: 44px;
                display: grid;
                place-items: center;
                border-radius: 12px;
                margin: 2px auto 10px;
            }

            .pill h4 {
                margin: 6px 0 6px;
                font-size: 15px;
            }

            .pill p {
                color: #cfd7ff;
                font-size: 13px;
            }

        /* Alt: 2 sütun içerik */
        .fh-grid {
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            gap: 28px;
            align-items: center;
        }

        /* Mockup */
        .fh-shot {
            position: relative;
            border-radius: 18px;
            padding: 2px;
            background: linear-gradient(135deg, rgba(255,110,199,.35), rgba(124,77,255,.35));
            box-shadow: 0 18px 40px rgba(12,27,77,.3);
            margin-left:-6px;
        }

            .fh-shot img {
                display: block;
                width: 100%;
                border-radius: 16px;
                height: clamp(240px, 40vw, 420px);
                object-fit: cover;
                background: #0f1b4f;
                border: 1px solid rgba(255,255,255,.12);
                transition: transform .35s ease;
            }

            .fh-shot:hover img {
                transform: scale(1.02);
            }

        /* üstte küçük tarayıcı çubuğu */
        .chrome {
            position: absolute;
            left: 14px;
            top: 10px;
            display: flex;
            gap: 6px;
        }

            .chrome .dot {
                width: 10px;
                height: 10px;
                border-radius: 50%;
                background: #ff8ccf;
                box-shadow: 0 0 0 1px rgba(255,255,255,.25) inset;
            }

                .chrome .dot:nth-child(2) {
                    background: #7c4dff;
                }

                .chrome .dot:nth-child(3) {
                    background: #5ec5ff;
                }

        /* Metin alanı */

        .fh-copy {
           
            align-self: start; /* center yerine start yapıyoruz */
        }

        .fh-copy p {
            color: #dbe3ff;
          
        }

        .ticks {
            list-style: none;
            padding-left: 0;
            margin: 14px 0 18px;
        }

            .ticks li {
                display: flex;
                align-items: center;
                gap: 10px;
                margin: 8px 0;
                color: #cfe0ff;
            }

            .ticks i {
                width: 22px;
                height: 22px;
                border-radius: 50%;
                display: grid;
                place-items: center;
                background: rgba(255,255,255,.10);
                border: 1px solid rgba(255,255,255,.16);
                color: var(--pembe);
            }

        /* CTA butonları */
        .features-hero .cta-row {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        /* Arkaplan süsleri */
        .bg-shape {
            position: absolute;
            filter: blur(60px);
            opacity: .35;
            z-index: -1;
        }

            .bg-shape.one {
                width: 420px;
                height: 420px;
                left: -120px;
                top: -80px;
                background: radial-gradient(closest-side, rgba(124,77,255,.6), transparent);
            }

            .bg-shape.two {
                width: 460px;
                height: 460px;
                right: -140px;
                bottom: -120px;
                background: radial-gradient(closest-side, rgba(94,197,255,.5), transparent);
            }
/* iOS güvenli alan içeri alma (çentik vb.) */
@supports (padding: max(0px)) {
  .features-hero{
    padding-left: max(clamp(16px, 4vw, 56px), env(safe-area-inset-left));
    padding-right: max(clamp(16px, 4vw, 56px), env(safe-area-inset-right));
    padding-top: max(clamp(18px, 3vw, 42px), env(safe-area-inset-top));
    padding-bottom: max(clamp(18px, 3vw, 42px), env(safe-area-inset-bottom));
  }
}

/* ---------- Breakpoints ---------- */

/* ≤ 1200px: 5 → 4 sütun kapsül; tipografi hafif küçülür */
@media (max-width:1200px){
  .pill-cards{ grid-template-columns: repeat(4, minmax(0,1fr)); }
}

/* ≤ 992px (büyük tablet/iPad yatay): 4 → 3 sütun; alt grid 1 sütuna yaklaşır */
@media (max-width:992px){
  .pill-cards{ grid-template-columns: repeat(3, minmax(0,1fr)); }
  .fh-grid{ grid-template-columns: 1fr; }
  .fh-shot img{ height: clamp(240px, 52vw, 360px); }
  .fh-head h2::after{ width: 84px; }

  /* yazıları sola hizala */
  .fh-copy,
  .fh-copy p,
  .fh-copy ul,
  .fh-copy li,
  .fh-copy .cta-row {
    text-align: left;
    justify-content: flex-start;
  }
}

/* ≤ 768px (tablet & telefon): 3 → 2 sütun; boşluklar sıkı, metinler okunur */
@media (max-width:768px){
  .pill-cards{ grid-template-columns: repeat(2,1fr); }
  .features-hero{ padding: clamp(16px, 4vw, 32px); }
  .fh-head h2{ font-size: clamp(21px, 6vw, 30px); }
  .fh-shot img{ height: clamp(220px, 58vw, 320px); }
  .ticks li{ gap: 8px; }
  .ticks i{ width: 20px; height: 20px; }

  /* yazıları sola hizala */
  .fh-copy,
  .fh-copy p,
  .fh-copy ul,
  .fh-copy li,
  .fh-copy .cta-row {
    text-align: left;
    justify-content: flex-start;
  }
}

/* ≤ 576px (küçük telefonlar): 2 → 1 sütun; dokunma hedefleri büyütülür */
@media (max-width:576px){
  .pill-cards{ grid-template-columns: 1fr; }
  .pill{ padding: 14px 12px; }
  .features-hero .cta-row a{ width: 100%; text-align: center; }
  .fh-head h2::after{ width: 72px; height: 3px; }

  /* yazıları sola hizala */
  .fh-copy,
  .fh-copy p,
  .fh-copy ul,
  .fh-copy li,
  .fh-copy .cta-row {
    text-align: left;
    justify-content: flex-start;
  }
}

/* ≤ 400px (çok küçük cihazlar): yazılar ve görsel güvenli seviyeye iner */
@media (max-width:400px){
  .fh-head h2{ font-size: clamp(20px, 7.2vw, 26px); }
  .fh-shot img{ height: clamp(200px, 60vw, 280px); }
  .pill h4{ font-size: 13px; }
  .pill p{ font-size: 12px; }

  /* yazıları sola hizala */
  .fh-copy,
  .fh-copy p,
  .fh-copy ul,
  .fh-copy li,
  .fh-copy .cta-row {
    text-align: left;
    justify-content: flex-start;
  }
}

/* Hover desteklemeyen cihazlarda hover efektlerini yumuşat */
@media (hover:none){
  .pill:hover{ transform:none; box-shadow: 0 8px 26px rgba(12,27,77,.18); }
  .fh-shot:hover img{ transform:none; }
}

/* Karanlık tema zaten var: parıltıyı çok abartmadan koru */
@media (prefers-color-scheme: dark){
  .fh-head .sub{ color:#c8d2ff; }
  .pill p{ color:#d4dcff; }
}

/* Hareket azaltma tercihi: animasyonları kıs */
@media (prefers-reduced-motion: reduce){
  .pill, .fh-shot img{ transition: none !important; }
}

/* Yatay yönelimde görseli biraz büyüt, metin satır uzunluğunu kısalt */
@media (orientation: landscape) and (max-width:900px){
  .fh-shot img{ height: clamp(220px, 46vw, 380px); }
  .features-hero{ padding-left: clamp(12px, 3vw, 28px); padding-right: clamp(12px, 3vw, 28px); }
}


        /* ===== Garanti CTA Bandı ===== */
        .guarantee-strip {
            background: linear-gradient(90deg, #207CF2, #5167E7 45%, #7A4DE8 75%, #B055E0);
            color: #fff;
            padding: 40px 20px; /* dikey alan azaltıldı */
        }

        .guarantee-wrap {
            max-width: 900px; /* genişliği sınırladık */
            margin: 0 auto;
            text-align: center;
        }

            .guarantee-wrap h2 {
                font-size: clamp(24px, 3.2vw, 36px);
                margin: 0 0 10px;
            }

            .guarantee-wrap p {
                margin: 0 0 20px;
                font-size: clamp(14px, 2vw, 16px);
                color: rgba(255,255,255,.92);
            }

        .cta-pill {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 12px 24px;
            background: #fff;
            color: #1b244a;
            text-decoration: none;
            border-radius: 999px;
            font-weight: 700;
            transition: transform .15s ease, box-shadow .2s ease;
        }


        /* =========================
   Garanti CTA Bandı - Mobil Responsive
   ========================= */

/* Tablet ve küçük cihazlar (≤992px) */
@media (max-width: 992px) {
  .guarantee-strip {
    padding: 32px 18px;
  }

  .guarantee-wrap {
    text-align: left; /* Mobilde sola hizalı */
    padding: 0 6px;
  }

  .guarantee-wrap h2 {
    font-size: clamp(20px, 4.6vw, 28px);
    line-height: 1.2;
  }

  .guarantee-wrap p {
    font-size: clamp(13px, 3.8vw, 15px);
  }

  .cta-pill {
    padding: 10px 20px;
    font-size: 14px;
  }
}

/* Telefonlar (≤768px) */
@media (max-width: 768px) {
  .guarantee-strip {
    padding: 28px 16px;
  }

  .guarantee-wrap h2 {
    font-size: clamp(18px, 5.2vw, 24px);
  }

  .guarantee-wrap p {
    margin-bottom: 18px;
    font-size: clamp(12px, 4vw, 14px);
  }

  .cta-pill {
    width: 100%;              /* Buton tam genişlik */
    justify-content: center;  /* İkon ve metin ortalanır */
    font-size: 14px;
  }
}

/* Küçük telefonlar (≤576px) */
@media (max-width: 576px) {
  .guarantee-strip {
    padding: 24px 14px;
  }

  .guarantee-wrap h2 {
    font-size: clamp(17px, 6vw, 22px);
  }

  .guarantee-wrap p {
    font-size: 13px;
  }

  .cta-pill {
    padding: 10px 18px;
    gap: 8px;
    font-size: 13px;
  }
}

/* Çok küçük cihazlar (≤400px) */
@media (max-width: 400px) {
  .guarantee-strip {
    padding: 20px 12px;
  }

  .guarantee-wrap h2 {
    font-size: 18px;
  }

  .guarantee-wrap p {
    font-size: 12px;
  }

  .cta-pill {
    padding: 9px 16px;
    font-size: 12px;
  }
}


    </style>
</head>
<body>
    <uc:Header ID="Header1" runat="server" />

  
  <!-- Hero -->
<section class="hero">
    <div class="hero-inner">
        <div>
            <span class="kicker"><i class="fa-solid fa-sparkles"></i> Dinamik • Hızlı • Güvenli • Yeni Nesil</span>
            <h1>Kişiselleştirilmiş & Hazır <br />Web Siteleri Sizin İçin</h1>
            <p class="lead">
                İster sıfırdan özgün tasarım, ister hazır şablonlarla hızlı başlangıç.  
                Marka kimliğinize uygun, güvenli ve modern çözümlerle dakikalar içinde yayına çıkın.  
                Neon pastel dokunuşlarla farkınızı gösterin.
            </p>
            <div class="cta-row">
                <a class="cta primary" href="iletisim.aspx"><i class="fa-solid fa-rocket"></i> Bize Ulaşın</a>
                <a class="cta secondary" href="websayfalari.aspx"><i class="fa-solid fa-images"></i> Keşfetmeye Başla</a>
            </div>
        </div>
       <div class="mockup floaty">
    <div class="glass-card">
        <div class="screen">
            <pre class="code">&lt;<span class="tag">section</span> <span class="attr">class</span>="hero"&gt;
  Kişisel 👩‍💻
  Hazır 🚀
  Neon pastel tasarım 🎨
  Mobil uyumlu 📱
  SEO & erişilebilir 🌍
  Güvenli altyapı 🔒
&lt;/<span class="tag">section</span>&gt;</pre>
        </div>
    </div>
</div>

    </div>
</section>

    <!-- Özellikler -->
    <section class="section" id="ozellikler">
        <div class="wrap">
            <h2>Öne Çıkan Özellikler</h2>
            <p class="sub">Modern tasarım dili, sürdürülebilir altyapı ve içerik odaklı geliştirme.</p>
            <div class="features">
                <div class="feat">
                    <i class="fa-solid fa-paintbrush"></i>
                    <h3>Modern UI</h3>
                    <p>Neon pastel palet, yumuşak gölgeler ve cam efekti ile şık görünüm.</p>
                    <div class="chips">
                        <span class="chip">Glassmorphism</span>
                        <span class="chip">Responsive</span>
                        <span class="chip">İkon Seti</span>
                    </div>
                </div>
                <div class="feat">
                    <i class="fa-solid fa-lock"></i>
                    <h3>Güvenli Altyapı</h3>
                    <p>SSL, yedekleme, güvenlik duvarı ve güncel yazılım bileşenleri.</p>
                    <div class="chips">
                        <span class="chip">SSL</span>
                        <span class="chip">Backup</span>
                        <span class="chip">WAF</span>
                    </div>
                </div>
                <div class="feat">
                    <i class="fa-solid fa-magnifying-glass-chart"></i>
                    <h3>SEO & Analitik</h3>
                    <p>H1–H3 hiyerarşisi, meta/OG etiketleri ve analitik entegrasyonu.</p>
                    <div class="chips">
                        <span class="chip">Schema.org</span>
                        <span class="chip">OG Tags</span>
                        <span class="chip">GTM</span>
                    </div>
                </div>
            </div>
        </div>
    </section>





    <!-- Hepsi Bir Arada Bölümü -->
    <section class="section features-hero" id="hepsi-bir-arada">
        <div class="wrap">

            <!-- Başlık (en üstte) -->
            <header class="fh-head">
                <span class="fh-kicker"><i class="fa-solid fa-grid-2"></i> Tüm Modüller Tek Pakette</span>
                <h2>Hepsi Bir Arada <span>Hazır Web</span> Çözümleri</h2>
                <p class="sub">Modern tasarım, güçlü altyapı ve kolay yönetim paneliyle kısa sürede yayına çıkın.</p>
            </header>

            <!-- Üst: ikonlu kartlar -->
            <div class="pill-cards">
                <article class="pill">
                    <i class="fa-solid fa-envelope"></i>
                    <h4>E-posta Hizmetleri</h4>
                    <p>Kurumsal e-posta adreslerinizle profesyonel iletişim.</p>
                </article>
                <article class="pill">
                    <i class="fa-solid fa-server"></i>
                    <h4>Sunucu Hizmetleri</h4>
                    <p>TR merkezli güçlü altyapı ile kesintisiz yayın.</p>
                </article>
                <article class="pill">
                    <i class="fa-solid fa-lock"></i>
                    <h4>SSL Sertifikası</h4>
                    <p>Güvenli veri iletimi ve ziyaretçi güveni.</p>
                </article>
                <article class="pill">
                    <i class="fa-solid fa-rotate"></i>
                    <h4>Yazılım Güncellemeleri</h4>
                    <p>Her zaman güncel ve güvenli kalın.</p>
                </article>
                <article class="pill">
                    <i class="fa-solid fa-headset"></i>
                    <h4>Destek</h4>
                    <p>Ulaşılabilir ve hızlı destek ekibi.</p>
                </article>
            </div>

            <!-- Alt: 2 sütun içerik -->
            <div class="fh-grid">
                <figure class="fh-shot">
                    <img src="resim/siteörnegi.png" alt="Helin Studio web şablon önizleme">
                    <div class="chrome"><span class="dot"></span><span class="dot"></span><span class="dot"></span></div>
                </figure>

                <div class="fh-copy">
                    <p>Hazır web çözümlerimizle <strong>tasarım</strong>, <strong>güvenlik</strong> ve <strong>performansı</strong> tek pakette sunuyoruz. İçeriklerinizi kolayca yönetin, SEO ve analitik entegrasyonlarıyla büyümeyi hızlandırın.</p>
                    <ul class="ticks">
                        <li><i class="fa-solid fa-check"></i> Tam mobil uyum ve yüksek hız</li>
                        <li><i class="fa-solid fa-check"></i> SSL, yedekleme ve güvenlik katmanları</li>
                        <li><i class="fa-solid fa-check"></i> Çok dilli yapı ve blog modülü</li>
                    </ul>
                    <div class="cta-row">
                        <a class="cta primary" href="fiyatlar.aspx"><i class="fa-solid fa-paper-plane"></i> Fiyatlar</a>
                        <a class="cta secondary" href="iletisim.aspx"><i class="fa-solid fa-images"></i> Bize Ulaşın</a>
                    </div>
                </div>
            </div>

        </div>

        <!-- arka plan süsleri -->
        <div class="bg-shape one"></div>
        <div class="bg-shape two"></div>
    </section>


 <!-- Garanti CTA Bandı -->
<section class="section guarantee-strip" id="garanti">
    <div class="guarantee-wrap">
        <h2>Memnun Kalmazsanız İade Garantili!</h2>
        <p>Hazır web sitesi satın aldığınızda memnun kalmazsanız, <strong>7 gün</strong> içinde iade edebilirsiniz.</p>
        <a class="cta-pill" href="iadesayfasi.aspx">
            <i class="fa-solid fa-info-circle"></i> Detaylar
        </a>
    </div>

    <!-- Üstte yumuşak dekor (opsiyonel) -->
    <div class="guarantee-wave"></div>
</section>






    <!-- Süreç -->
    <section class="section" id="surec">
        <div class="wrap">
            <h2>3 Adımda Yayında</h2>
            <p class="sub">Hızlı kurulum ve net iletişim. Zamanını tasarruf et.</p>

            <div class="steps">
                <article class="step">
                    <figure class="thumb">
                        <img src="resim/1.adım.png" alt="Keşif & Tasarım">
                        <span class="badge">1. Adım</span>
                    </figure>
                    <div class="step-body">
                        <h3>Keşif & Tasarım</h3>
                        <p>İhtiyaç listesi, renk/ton, tipografi ve site haritası belirlenir.</p>
                    </div>
                </article>

                <article class="step">
                    <figure class="thumb">
                        <img src="resim/2.adım.png" alt="Kurulum & İçerik">
                        <span class="badge">2. Adım</span>
                    </figure>
                    <div class="step-body">
                        <h3>Kurulum & İçerik</h3>
                        <p>Şablon kurulumu, sayfa yerleşimleri, görsel ve metin girişleri.</p>
                    </div>
                </article>

                <article class="step">
                    <figure class="thumb">
                        <img src="resim/3.adım.png" alt="Yayın & Optimize">
                        <span class="badge">3. Adım</span>
                    </figure>
                    <div class="step-body">
                        <h3>Yayın & Optimize</h3>
                        <p>SSL, domain, temel SEO & analitik ve performans düzenlemeleri.</p>
                    </div>
                </article>
            </div>
        </div>
    </section>

    <uc:ContactWidget ID="ContactWidget1" runat="server" />


    <uc:Footer ID="Footer1" runat="server" />




    <script>
        // Mobile drawer
        const hamb = document.querySelector('.hamb');
        const drawer = document.getElementById('drawer');
        hamb?.addEventListener('click', () => drawer.classList.toggle('open'));

     
    </script>
</body>
</html>

