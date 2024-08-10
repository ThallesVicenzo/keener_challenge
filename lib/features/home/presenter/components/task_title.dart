import 'package:flutter/material.dart';
import 'package:keener_challenge/core/presenter/widgets/text/app_text.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.title,
    required this.isCompleted,
    this.confirmDismiss,
    this.onTap,
  });

  final String title;
  final bool isCompleted;
  final void Function()? onTap;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      confirmDismiss: confirmDismiss,
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 63,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: AppText(
                  title,
                  fontSize: FontSize.mediumSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: AppText(
                        isCompleted ? 'Done ✅' : 'Not Done ❌',
                        fontSize: FontSize.extraSmall,
                        style: MyTextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
