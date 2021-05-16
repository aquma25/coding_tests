# 圧縮Main処理
require 'zip'
require 'fileutils'

file_name = "file_name.rb"
zip_file_name = "zip_file.zip"

# 圧縮処理
begin
  Zip::OutputStream.open("work/" + zip_file_name) do |out| 

    # zipファイル内に書き込むファイルのパスを指定
    out.put_next_entry(file_name) 

    # zipファイルへ内容を書き込む
    buffer = File.read("work/" + file_name)
    out.write(buffer)
  end
rescue
  raise "圧縮処理失敗"
end

# 作成したzipファイルのサイズ確認(bite単位)
zip_file_path = Dir.pwd + "/work/" + zip_file_name
file_size = File.size(zip_file_path)
puts "ZipFileSize: #{file_size} bite"
raise "サイズ超過！！" if file_size > 1000000

# 連携ディレクトリ配置処理
# 圧縮したファイルを連携ディレクトリにファイルをコピー
begin
  FileUtils.cp(zip_file_path, Dir.pwd + "/cooperation/" + zip_file_name)
rescue
  raise "連携Dir配置エラー！！"
end

# バックアップ取得
# 圧縮したファイルをバックアップディレクトリにファイルをコピー
begin
  FileUtils.cp(zip_file_path, Dir.pwd + "/backup/" + zip_file_name)
  FileUtils.rm_f(Dir.pwd + "/work/" + zip_file_name)
  FileUtils.rm_f(Dir.pwd + "/work/" + file_name)
rescue
  raise "バックアップエラー！！"
end
