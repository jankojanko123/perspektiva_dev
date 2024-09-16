import '/components/loader_item/loader_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'perpsektiva_dashboard_loading_model.dart';
export 'perpsektiva_dashboard_loading_model.dart';

class PerpsektivaDashboardLoadingWidget extends StatefulWidget {
  const PerpsektivaDashboardLoadingWidget({super.key});

  @override
  State<PerpsektivaDashboardLoadingWidget> createState() =>
      _PerpsektivaDashboardLoadingWidgetState();
}

class _PerpsektivaDashboardLoadingWidgetState
    extends State<PerpsektivaDashboardLoadingWidget> {
  late PerpsektivaDashboardLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerpsektivaDashboardLoadingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final loaderItems = List.generate(random_data.randomInteger(0, 0),
                (index) => random_data.randomName(true, true))
            .toList()
            .take(4)
            .toList();

        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.79,
          ),
          scrollDirection: Axis.vertical,
          itemCount: loaderItems.length,
          itemBuilder: (context, loaderItemsIndex) {
            final loaderItemsItem = loaderItems[loaderItemsIndex];
            return LoaderItemWidget(
              key: Key('Keyi8f_${loaderItemsIndex}_of_${loaderItems.length}'),
            );
          },
        );
      },
    );
  }
}
