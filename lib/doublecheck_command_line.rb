class DoubleCheck::CommandLine < DoubleCheck::Sitemap
  def record_result(url, response)
    super(url, response)
    $stdout.write_nonblock('.')

  end
end
