{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "bid",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('test_airbyte_ttgt_ab3') }}
select
    id,
    link,
    deleted,
    loai_tb,
    so_tbmt,
    linh_vuc,
    nguon_von,
    phan_loai,
    tien_dbdt,
    {{ adapter.quote('timestamp') }},
    company_id,
    ten_khlcnt,
    trang_thai,
    gia_du_toan,
    ten_du_toan,
    ben_moi_thau,
    gia_goi_thau,
    hinh_thuc_tb,
    send_mail_id,
    ten_goi_thau,
    competitor_id,
    loai_hop_dong,
    score_by_name,
    score_service,
    gia_trung_thau,
    hinh_thuc_dbdt,
    hinh_thuc_lcnt,
    ngay_phe_duyet,
    score_by_scope,
    so_hieu_khlcnt,
    hieu_luc_e_hsdt,
    so_tbmt_version,
    dia_diem_mo_thau,
    phuong_thuc_lcnt,
    don_vi_trung_thau,
    hinh_thuc_du_thau,
    dia_diem_nhan_hsdt,
    dia_diem_thuc_hien,
    thoi_diem_dang_tai,
    nhan_e_hsdt_tu_ngay,
    thoi_gian_thuc_hien,
    nhan_e_hsdt_den_ngay,
    thoi_diem_dong_mo_thau,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_test_airbyte_ttgt_hashid
from {{ ref('test_airbyte_ttgt_ab3') }}
-- test_airbyte_ttgt from {{ source('bid', '_airbyte_raw_test_airbyte_ttgt') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

