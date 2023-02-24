{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_bid",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('test_airbyte_ttgt_ab1') }}
select
    cast(id as {{ dbt_utils.type_bigint() }}) as id,
    cast(link as {{ dbt_utils.type_string() }}(1024)) as link,
    cast(deleted as {{ dbt_utils.type_bigint() }}) as deleted,
    cast(loai_tb as {{ dbt_utils.type_string() }}(1024)) as loai_tb,
    cast(so_tbmt as {{ dbt_utils.type_string() }}(1024)) as so_tbmt,
    cast(linh_vuc as {{ dbt_utils.type_string() }}(1024)) as linh_vuc,
    cast(nguon_von as {{ dbt_utils.type_string() }}(1024)) as nguon_von,
    cast(phan_loai as {{ dbt_utils.type_string() }}(1024)) as phan_loai,
    cast(tien_dbdt as {{ dbt_utils.type_string() }}(1024)) as tien_dbdt,
    cast({{ adapter.quote('timestamp') }} as {{ dbt_utils.type_string() }}(1024)) as {{ adapter.quote('timestamp') }},
    cast(company_id as {{ dbt_utils.type_string() }}(1024)) as company_id,
    cast(ten_khlcnt as {{ dbt_utils.type_string() }}(6044)) as ten_khlcnt,
    cast(trang_thai as {{ dbt_utils.type_bigint() }}) as trang_thai,
    cast(gia_du_toan as {{ dbt_utils.type_float() }}) as gia_du_toan,
    cast(ten_du_toan as {{ dbt_utils.type_string() }}(1024)) as ten_du_toan,
    cast(ben_moi_thau as {{ dbt_utils.type_string() }}(1024)) as ben_moi_thau,
    cast(gia_goi_thau as {{ dbt_utils.type_float() }}) as gia_goi_thau,
    cast(hinh_thuc_tb as {{ dbt_utils.type_string() }}(1024)) as hinh_thuc_tb,
    cast(send_mail_id as {{ dbt_utils.type_string() }}(1024)) as send_mail_id,
    cast(ten_goi_thau as {{ dbt_utils.type_string() }}(1024)) as ten_goi_thau,
    cast(competitor_id as {{ dbt_utils.type_string() }}(1024)) as competitor_id,
    cast(loai_hop_dong as {{ dbt_utils.type_string() }}(1024)) as loai_hop_dong,
    cast(score_by_name as {{ dbt_utils.type_float() }}) as score_by_name,
    cast(score_service as {{ dbt_utils.type_float() }}) as score_service,
    cast(gia_trung_thau as {{ dbt_utils.type_string() }}(1024)) as gia_trung_thau,
    cast(hinh_thuc_dbdt as {{ dbt_utils.type_string() }}(1024)) as hinh_thuc_dbdt,
    cast(hinh_thuc_lcnt as {{ dbt_utils.type_string() }}(1024)) as hinh_thuc_lcnt,
    cast(ngay_phe_duyet as {{ dbt_utils.type_string() }}(1024)) as ngay_phe_duyet,
    cast(score_by_scope as {{ dbt_utils.type_float() }}) as score_by_scope,
    cast(so_hieu_khlcnt as {{ dbt_utils.type_string() }}(1024)) as so_hieu_khlcnt,
    cast(hieu_luc_e_hsdt as {{ dbt_utils.type_string() }}(1024)) as hieu_luc_e_hsdt,
    cast(so_tbmt_version as {{ dbt_utils.type_string() }}(1024)) as so_tbmt_version,
    cast(dia_diem_mo_thau as {{ dbt_utils.type_string() }}(1024)) as dia_diem_mo_thau,
    cast(phuong_thuc_lcnt as {{ dbt_utils.type_string() }}(1024)) as phuong_thuc_lcnt,
    cast(don_vi_trung_thau as {{ dbt_utils.type_string() }}(1024)) as don_vi_trung_thau,
    cast(hinh_thuc_du_thau as {{ dbt_utils.type_string() }}(1024)) as hinh_thuc_du_thau,
    cast(dia_diem_nhan_hsdt as {{ dbt_utils.type_string() }}(1024)) as dia_diem_nhan_hsdt,
    cast(dia_diem_thuc_hien as {{ dbt_utils.type_string() }}(1024)) as dia_diem_thuc_hien,
    cast(thoi_diem_dang_tai as {{ dbt_utils.type_string() }}(1024)) as thoi_diem_dang_tai,
    cast(nhan_e_hsdt_tu_ngay as {{ dbt_utils.type_string() }}(1024)) as nhan_e_hsdt_tu_ngay,
    cast(thoi_gian_thuc_hien as {{ dbt_utils.type_string() }}(1024)) as thoi_gian_thuc_hien,
    cast(nhan_e_hsdt_den_ngay as {{ dbt_utils.type_string() }}(1024)) as nhan_e_hsdt_den_ngay,
    cast(thoi_diem_dong_mo_thau as {{ dbt_utils.type_string() }}(1024)) as thoi_diem_dong_mo_thau,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('test_airbyte_ttgt_ab1') }}
-- test_airbyte_ttgt
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

