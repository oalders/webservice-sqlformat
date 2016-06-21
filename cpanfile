requires "JSON::MaybeXS" => "0";
requires "LWP::ConsoleLogger::Easy" => "0";
requires "LWP::UserAgent" => "0";
requires "Moo" => "0";
requires "Types::Standard" => "0";
requires "Types::URI" => "0";
requires "perl" => "5.006";

on 'build' => sub {
  requires "Module::Build" => "0.28";
};

on 'test' => sub {
  requires "DDP" => "0";
  requires "Test2::Bundle::More" => "0";
  requires "perl" => "5.006";
  requires "strict" => "0";
  requires "warnings" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "Module::Build" => "0.28";
  requires "perl" => "5.004";
};

on 'develop' => sub {
  requires "Test::CPAN::Changes" => "0.19";
  requires "Test::Synopsis" => "0";
};
