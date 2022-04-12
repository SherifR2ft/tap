/*
final MediaQueryData mediaQuery = MediaQuery.of(context);
SizedBox(
height: mediaQuery.viewInsets.bottom > (kIsWeb ? 75 : 50)
? mediaQuery.viewInsets.bottom - (kIsWeb ? 75 : 50)
: 1, //,
)

or

SizedBox(
            height: mediaQuery.viewInsets.bottom > (kIsWeb ? 75 : 50)
                ? mediaQuery.viewInsets.bottom
                : 1, //,
          )
 */
