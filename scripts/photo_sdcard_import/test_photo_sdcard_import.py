from photo_sdcard_import import album_directory


from datetime import date


def test_album_directory():
    assert (
        album_directory(date(2024, 6, 1), date(2024, 6, 1), "Test Album")
        == "2024-06-01 Test Album"
    )
    assert (
        album_directory(date(2024, 6, 1), date(2024, 6, 2), "Test Album")
        == "2024-06-01 02 Test Album"
    )
    assert (
        album_directory(date(2024, 6, 1), date(2024, 7, 1), "Test Album")
        == "2024-06-01 07-01 Test Album"
    )
    assert (
        album_directory(date(2024, 6, 1), date(2025, 6, 1), "Test Album")
        == "2024-06-01 2025-06-01 Test Album"
    )
