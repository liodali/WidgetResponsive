class RSize {
  final double xsmall;
  final double small;
  final double medium;
  final double large;
  final double xlarge;

  const RSize({
    required this.xlarge,
    required this.large,
    required this.medium,
    required this.small,
    required this.xsmall,
  });
  const RSize.zero()
      : xlarge = 0.0,
        large = 0.0,
        medium = 0.0,
        small = 0.0,
        xsmall = 0.0;

  List<double> get sizes => [
        xlarge,
        large,
        medium,
        small,
        xsmall,
      ];

  @override
  String toString() => 'xl:$xlarge,l:$large,m:$medium,s:$small,xs:$xsmall';
}
