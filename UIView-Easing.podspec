Pod::Spec.new do |s|

    s.name              = 'UIView-Easing'
    s.version           = '0.0.1'
    s.summary			= 'Adding Easing to UIView animation blocks'
    s.description       = 'Inspired from UIView-EasingFunctions with some difference in implementation, this doesnt use AHEasing, instead it uses CAMediaTimingFunction. Created mainly because the previously mentioned repo doesnt support ios8 and results in spazzy animations and also has problems with 64bit architecture.'
    s.homepage          = 'https://github.com/thegreatloser/UIView-Easing'
    s.platform          = :ios, '7.0'
    s.license           = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author            = {
        'Tapan Thaker' => 'tapan.d.thaker@gmail.com'
    }
    s.source            = {
        :git => 'https://github.com/thegreatloser/UIView-Easing.git',
        :tag => s.version.to_s
    }
    s.source_files      = 'Source/*.{m,h}'
    s.requires_arc      = true

end