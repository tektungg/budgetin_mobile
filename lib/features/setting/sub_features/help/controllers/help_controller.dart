import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:budgetin/features/setting/sub_features/help/models/help_model.dart';
import 'package:budgetin/shared/styles/styles.dart';

class HelpController extends GetxController {
  static HelpController get to => Get.find();

  // Observable variables
  final RxString _searchQuery = ''.obs;
  final RxBool _isSearching = false.obs;

  // Getters
  String get searchQuery => _searchQuery.value;
  bool get isSearching => _isSearching.value;

  // FAQ Data
  List<FAQItem> get faqData => [
        const FAQItem(
          id: '1',
          question: 'How to add a new transaction?',
          answer:
              'To add a new transaction, tap the green plus (+) button in the bottom right corner of the main page. Choose transaction type (income or expense), fill in transaction details, and select the source account.',
        ),
        const FAQItem(
          id: '2',
          question: 'How to add a new account/wallet?',
          answer:
              'Go to Profile > Manage Accounts, then tap the "Add" button in the top right corner. Fill in the account name, select account type (cash, bank, e-wallet, etc.), and enter the initial balance.',
        ),
        const FAQItem(
          id: '3',
          question: 'Is my data safe?',
          answer:
              'Yes, your data is very secure. Budgetin uses end-to-end encryption and does not store your bank account information or passwords. All data is stored locally on your device.',
        ),
        const FAQItem(
          id: '4',
          question: 'How to change app language?',
          answer:
              'Go to Profile > Settings > Language. Select your preferred language from the available list. Currently we support English, Indonesian, and Malay.',
        ),
        const FAQItem(
          id: '5',
          question: 'Can I backup my data?',
          answer:
              'Yes, you can backup your data through Profile > Settings > Data Management > Export Data. The backup file will be saved in a secure format and can be imported back if needed.',
        ),
        const FAQItem(
          id: '6',
          question: 'How to set monthly budget?',
          answer:
              'Monthly budget feature is under development and will be available in the upcoming update. You will be able to set spending limits per category and receive notifications when approaching limits.',
        ),
        const FAQItem(
          id: '7',
          question: 'Can I sync across devices?',
          answer:
              'Cloud synchronization feature is under development. Currently data is stored locally on your device. Make sure to backup regularly through the export data feature.',
        ),
        const FAQItem(
          id: '8',
          question: 'How to delete a transaction?',
          answer:
              'Open the "All Transactions" page, find the transaction you want to delete, then swipe left on the transaction item and select delete option. Or go into transaction details and select the delete button.',
        ),
      ];

  // Contact Methods
  List<ContactMethod> get contactMethods => [
        const ContactMethod(
          icon: Icons.email,
          title: 'Email Support',
          description: 'support@budgetin.app',
          action: 'mailto:support@budgetin.app',
          type: ContactType.email,
        ),
        const ContactMethod(
          icon: Icons.chat,
          title: 'Live Chat',
          description: 'Chat with support team',
          action: '#',
          type: ContactType.chat,
        ),
        const ContactMethod(
          icon: Icons.phone,
          title: 'Phone',
          description: '+62 21 1234 5678',
          action: 'tel:+622112345678',
          type: ContactType.phone,
        ),
      ];

  // Tips & Tricks
  List<TipCard> get tipsCards => [
        TipCard(
          emoji: '💡',
          title: 'Daily Tips',
          description:
              'Record every small expense to get an accurate financial picture.',
          backgroundColor: AppColors.info.withValues(alpha: 0.1),
          borderColor: AppColors.info,
          titleColor: AppColors.info,
          descriptionColor: AppColors.info.withValues(alpha: 0.8),
        ),
        TipCard(
          emoji: '🎯',
          title: 'Budget Strategy',
          description:
              'Apply the 50-30-20 rule: 50% needs, 30% wants, 20% savings.',
          backgroundColor: AppColors.success.withValues(alpha: 0.1),
          borderColor: AppColors.success,
          titleColor: AppColors.success,
          descriptionColor: AppColors.success.withValues(alpha: 0.8),
        ),
        TipCard(
          emoji: '⚡',
          title: 'Hidden Feature',
          description:
              'Swipe left on transactions for faster edit and delete options.',
          backgroundColor: AppColors.warning.withValues(alpha: 0.1),
          borderColor: AppColors.warning,
          titleColor: AppColors.warning,
          descriptionColor: AppColors.warning.withValues(alpha: 0.8),
        ),
      ];

  // Filtered FAQ based on search
  List<FAQItem> get filteredFAQ {
    if (_searchQuery.value.isEmpty) {
      return faqData;
    }

    return faqData
        .where((faq) =>
            faq.question
                .toLowerCase()
                .contains(_searchQuery.value.toLowerCase()) ||
            faq.answer.toLowerCase().contains(_searchQuery.value.toLowerCase()))
        .toList();
  }

  // Methods
  void updateSearchQuery(String query) {
    _searchQuery.value = query;
  }

  void clearSearch() {
    _searchQuery.value = '';
  }

  Future<void> handleContactMethod(ContactMethod method) async {
    switch (method.type) {
      case ContactType.email:
      case ContactType.phone:
        await _launchUrl(method.action);
        break;
      case ContactType.chat:
        _showChatModal();
        break;
      case ContactType.external:
        await _launchUrl(method.action);
        break;
    }
  }

  Future<void> _launchUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        Get.snackbar(
          'Error',
          'Cannot open $url',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: AppColors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to open link',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
    }
  }

  void _showChatModal() {
    Get.dialog(
      AlertDialog(
        title: const Text('Live Chat'),
        content: const Text(
            'Live chat feature is coming soon! For now, please contact us via email or phone.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void navigateBack() {
    Get.back();
  }
}
