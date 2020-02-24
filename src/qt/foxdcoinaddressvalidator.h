// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017-2019 The Raven Core developers
// Copyright (c) 2020-2021 The Foxdcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef FOXDCOIN_QT_FOXDCOINADDRESSVALIDATOR_H
#define FOXDCOIN_QT_FOXDCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class FoxdcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit FoxdcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Foxdcoin address widget validator, checks for a valid foxdcoin address.
 */
class FoxdcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit FoxdcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // FOXDCOIN_QT_FOXDCOINADDRESSVALIDATOR_H
