{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_bid",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('bid', '_airbyte_raw_test_airbyte_ttgt') }}
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['link'], ['link']) }} as link,
    {{ json_extract_scalar('_airbyte_data', ['deleted'], ['deleted']) }} as deleted,
    {{ json_extract_scalar('_airbyte_data', ['loai_tb'], ['loai_tb']) }} as loai_tb,
    {{ json_extract_scalar('_airbyte_data', ['so_tbmt'], ['so_tbmt']) }} as so_tbmt,
    {{ json_extract_scalar('_airbyte_data', ['linh_vuc'], ['linh_vuc']) }} as linh_vuc,
    {{ json_extract_scalar('_airbyte_data', ['nguon_von'], ['nguon_von']) }} as nguon_von,
    {{ json_extract_scalar('_airbyte_data', ['phan_loai'], ['phan_loai']) }} as phan_loai,
    {{ json_extract_scalar('_airbyte_data', ['tien_dbdt'], ['tien_dbdt']) }} as tien_dbdt,
    {{ json_extract_scalar('_airbyte_data', ['timestamp'], ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    {{ json_extract_scalar('_airbyte_data', ['company_id'], ['company_id']) }} as company_id,
    {{ json_extract_scalar('_airbyte_data', ['ten_khlcnt'], ['ten_khlcnt']) }} as ten_khlcnt,
    {{ json_extract_scalar('_airbyte_data', ['trang_thai'], ['trang_thai']) }} as trang_thai,
    {{ json_extract_scalar('_airbyte_data', ['gia_du_toan'], ['gia_du_toan']) }} as gia_du_toan,
    {{ json_extract_scalar('_airbyte_data', ['ten_du_toan'], ['ten_du_toan']) }} as ten_du_toan,
    {{ json_extract_scalar('_airbyte_data', ['ben_moi_thau'], ['ben_moi_thau']) }} as ben_moi_thau,
    {{ json_extract_scalar('_airbyte_data', ['gia_goi_thau'], ['gia_goi_thau']) }} as gia_goi_thau,
    {{ json_extract_scalar('_airbyte_data', ['hinh_thuc_tb'], ['hinh_thuc_tb']) }} as hinh_thuc_tb,
    {{ json_extract_scalar('_airbyte_data', ['send_mail_id'], ['send_mail_id']) }} as send_mail_id,
    {{ json_extract_scalar('_airbyte_data', ['ten_goi_thau'], ['ten_goi_thau']) }} as ten_goi_thau,
    {{ json_extract_scalar('_airbyte_data', ['competitor_id'], ['competitor_id']) }} as competitor_id,
    {{ json_extract_scalar('_airbyte_data', ['loai_hop_dong'], ['loai_hop_dong']) }} as loai_hop_dong,
    {{ json_extract_scalar('_airbyte_data', ['score_by_name'], ['score_by_name']) }} as score_by_name,
    {{ json_extract_scalar('_airbyte_data', ['score_service'], ['score_service']) }} as score_service,
    {{ json_extract_scalar('_airbyte_data', ['gia_trung_thau'], ['gia_trung_thau']) }} as gia_trung_thau,
    {{ json_extract_scalar('_airbyte_data', ['hinh_thuc_dbdt'], ['hinh_thuc_dbdt']) }} as hinh_thuc_dbdt,
    {{ json_extract_scalar('_airbyte_data', ['hinh_thuc_lcnt'], ['hinh_thuc_lcnt']) }} as hinh_thuc_lcnt,
    {{ json_extract_scalar('_airbyte_data', ['ngay_phe_duyet'], ['ngay_phe_duyet']) }} as ngay_phe_duyet,
    {{ json_extract_scalar('_airbyte_data', ['score_by_scope'], ['score_by_scope']) }} as score_by_scope,
    {{ json_extract_scalar('_airbyte_data', ['so_hieu_khlcnt'], ['so_hieu_khlcnt']) }} as so_hieu_khlcnt,
    {{ json_extract_scalar('_airbyte_data', ['hieu_luc_e_hsdt'], ['hieu_luc_e_hsdt']) }} as hieu_luc_e_hsdt,
    {{ json_extract_scalar('_airbyte_data', ['so_tbmt_version'], ['so_tbmt_version']) }} as so_tbmt_version,
    {{ json_extract_scalar('_airbyte_data', ['dia_diem_mo_thau'], ['dia_diem_mo_thau']) }} as dia_diem_mo_thau,
    {{ json_extract_scalar('_airbyte_data', ['phuong_thuc_lcnt'], ['phuong_thuc_lcnt']) }} as phuong_thuc_lcnt,
    {{ json_extract_scalar('_airbyte_data', ['don_vi_trung_thau'], ['don_vi_trung_thau']) }} as don_vi_trung_thau,
    {{ json_extract_scalar('_airbyte_data', ['hinh_thuc_du_thau'], ['hinh_thuc_du_thau']) }} as hinh_thuc_du_thau,
    {{ json_extract_scalar('_airbyte_data', ['dia_diem_nhan_hsdt'], ['dia_diem_nhan_hsdt']) }} as dia_diem_nhan_hsdt,
    {{ json_extract_scalar('_airbyte_data', ['dia_diem_thuc_hien'], ['dia_diem_thuc_hien']) }} as dia_diem_thuc_hien,
    {{ json_extract_scalar('_airbyte_data', ['thoi_diem_dang_tai'], ['thoi_diem_dang_tai']) }} as thoi_diem_dang_tai,
    {{ json_extract_scalar('_airbyte_data', ['nhan_e_hsdt_tu_ngay'], ['nhan_e_hsdt_tu_ngay']) }} as nhan_e_hsdt_tu_ngay,
    {{ json_extract_scalar('_airbyte_data', ['thoi_gian_thuc_hien'], ['thoi_gian_thuc_hien']) }} as thoi_gian_thuc_hien,
    {{ json_extract_scalar('_airbyte_data', ['nhan_e_hsdt_den_ngay'], ['nhan_e_hsdt_den_ngay']) }} as nhan_e_hsdt_den_ngay,
    {{ json_extract_scalar('_airbyte_data', ['thoi_diem_dong_mo_thau'], ['thoi_diem_dong_mo_thau']) }} as thoi_diem_dong_mo_thau,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('bid', '_airbyte_raw_test_airbyte_ttgt') }} as table_alias
-- test_airbyte_ttgt
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

