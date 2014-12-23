module IconCutter
  module Versions
    PLATFORMS = %w(android ios wechat weibo ios_submition all)

    ANDROID_VERSIONS = []

    IOS_VERSIONS = [
      [29, 29],
      [58, 58],
      [80, 80],
      [87, 87],
      [120, 120],
      [180, 180]
    ]

    WECHAT_VERSIONS = [
      [28, 28],
      [108, 108]
    ]

    WEIBO_VERSIONS = [
      [16, 16],
      [80, 80],
      [120, 120]
    ]

    IOS_SUBMITION_VERSIONS = [
      [1024, 1024]
    ]
  end
end
