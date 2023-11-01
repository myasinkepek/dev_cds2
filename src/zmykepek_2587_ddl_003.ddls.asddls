@AbapCatalog.sqlViewName: 'ZMYKEPEK_CDS_003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Örnek 3'
define view ZMYKEPEK_2587_DDL_003 
    as select from ZMYKEPEK_2587_DDL_002
{
    vbeln,
    sum(conversion_netwr) as Toplam_Net_Deger,
    kunnrAd as Musteri_AdSoyad,
    count(*) as toplam_Fatura_Adedi,
    division(cast(sum(conversion_netwr) as abap.curr( 15, 2 )), cast(count(*) as abap.int1), 2) as Ortalama_miktar,
    left(fkdat, 4) as Faturalama_Yili,
    substring(fkdat, 5, 2) as Faturalama_Ayi,
    substring(fkdat, 7, 2) as Faturalama_Gunu,
    substring(inco2_l, 1, 3) as incoterm_yeri
}

group by vbeln,
         kunnrAd,
         fkdat,
         inco2_l
