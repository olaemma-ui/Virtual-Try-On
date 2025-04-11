import 'package:flutter/material.dart';

class OutfitSelectionScreen extends StatefulWidget {
  const OutfitSelectionScreen({Key? key}) : super(key: key);

  @override
  State<OutfitSelectionScreen> createState() => _OutfitSelectionScreenState();
}

class _OutfitSelectionScreenState extends State<OutfitSelectionScreen> {
  int _selectedOutfitIndex = 0;

  final List<OutfitItem> _outfits = [
    OutfitItem(
      imageUrl:
          'https://images.unsplash.com/photo-1593032465175-481ac7f401a0?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
      title: 'Business Suit',
      description: 'Classic dark suit with slim fit',
      price: 299.99,
    ),
    OutfitItem(
      imageUrl:
          'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
      title: 'Plaid Overcoat',
      description: 'Dark plaid overcoat with matching pants',
      price: 349.99,
    ),
    OutfitItem(
      imageUrl:
          'https://images.unsplash.com/photo-1611312449408-fcece27cdbb7?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
      title: 'Casual Button-Up',
      description: 'Dark short-sleeve button-up with pants',
      price: 129.99,
    ),
    OutfitItem(
      imageUrl:
          'https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
      title: 'Quarter-Zip Pullover',
      description: 'Light quarter-zip pullover with gray pants',
      price: 159.99,
    ),
    OutfitItem(
      imageUrl:
          'https://images.unsplash.com/photo-1578932750294-f5075e85f44a?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
      title: 'White Ensemble',
      description: 'All-white outfit with crossbody bag',
      price: 189.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 200,
              physics: AlwaysScrollableScrollPhysics(),
              // useMagnifier: true,
              // magnification: 1.2,
              onSelectedItemChanged: (index) {
                setState(() {
                  _selectedOutfitIndex = index;
                });
              },
              children: _outfits
                  .map(
                    (otf) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedOutfitIndex = _outfits.indexOf(otf);
                        });
                      },
                      child: OutfitCard(
                        outfit: otf,
                        isSelected:
                            _outfits.indexOf(otf) == _selectedOutfitIndex,
                        margin: const EdgeInsets.only(bottom: 16),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class OutfitItem {
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  OutfitItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });
}

class OutfitCard extends StatelessWidget {
  final OutfitItem outfit;
  final bool isSelected;
  final EdgeInsets margin;

  const OutfitCard({
    Key? key,
    required this.outfit,
    required this.isSelected,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      margin: margin,
      decoration: BoxDecoration(
        // color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: const Color.fromARGB(102, 0, 0, 0), width: 2)
            : null,
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.hardEdge,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.network(
          outfit.imageUrl,
          fit: BoxFit.cover,
          height: double.infinity,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
                color: Colors.grey,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(
                  Icons.broken_image,
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
