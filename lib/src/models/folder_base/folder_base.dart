abstract class FolderBase {
  final String name;
  final List<FolderBase> list;
  FolderBase({
    required this.name,
    this.list = const [],
  });
}
