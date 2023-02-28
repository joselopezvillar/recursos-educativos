<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fe32="http://www.facturae.es/Facturae/2009/v3.2/Facturae" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="fe32 xs">
	<xsl:decimal-format name="decimal" decimal-separator="."/>
	<xsl:template name="tmpl1_ThirdPartyType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::TaxIdentification)">
				<TaxIdentification>
					<xsl:call-template name="tmpl2_TaxIdentificationType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TaxIdentification>
			</xsl:if>
			<xsl:if test="boolean(self::LegalEntity)">
				<LegalEntity>
					<xsl:call-template name="tmpl3_LegalEntityType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</LegalEntity>
			</xsl:if>
			<xsl:if test="boolean(self::Individual)">
				<Individual>
					<xsl:call-template name="tmpl8_IndividualType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</Individual>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl2_TaxIdentificationType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::PersonTypeCode)">
				<PersonTypeCode>
					<xsl:value-of select="string(.)"/>
				</PersonTypeCode>
			</xsl:if>
			<xsl:if test="boolean(self::ResidenceTypeCode)">
				<ResidenceTypeCode>
					<xsl:value-of select="string(.)"/>
				</ResidenceTypeCode>
			</xsl:if>
			<xsl:if test="boolean(self::TaxIdentificationNumber)">
				<TaxIdentificationNumber>
					<xsl:value-of select="string(.)"/>
				</TaxIdentificationNumber>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl3_LegalEntityType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::CorporateName)">
				<CorporateName>
					<xsl:value-of select="string(.)"/>
				</CorporateName>
			</xsl:if>
			<xsl:if test="boolean(self::TradeName)">
				<TradeName>
					<xsl:value-of select="string(.)"/>
				</TradeName>
			</xsl:if>
			<xsl:if test="boolean(self::RegistrationData)">
				<RegistrationData>
					<xsl:call-template name="tmpl4_RegistrationDataType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</RegistrationData>
			</xsl:if>
			<xsl:if test="boolean(self::AddressInSpain)">
				<AddressInSpain>
					<xsl:call-template name="tmpl5_AddressType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</AddressInSpain>
			</xsl:if>
			<xsl:if test="boolean(self::OverseasAddress)">
				<OverseasAddress>
					<xsl:call-template name="tmpl6_OverseasAddressType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</OverseasAddress>
			</xsl:if>
			<xsl:if test="boolean(self::ContactDetails)">
				<ContactDetails>
					<xsl:call-template name="tmpl7_ContactDetailsType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</ContactDetails>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl4_RegistrationDataType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Book)">
				<Book>
					<xsl:value-of select="string(.)"/>
				</Book>
			</xsl:if>
			<xsl:if test="boolean(self::RegisterOfCompaniesLocation)">
				<RegisterOfCompaniesLocation>
					<xsl:value-of select="string(.)"/>
				</RegisterOfCompaniesLocation>
			</xsl:if>
			<xsl:if test="boolean(self::Sheet)">
				<Sheet>
					<xsl:value-of select="string(.)"/>
				</Sheet>
			</xsl:if>
			<xsl:if test="boolean(self::Folio)">
				<Folio>
					<xsl:value-of select="string(.)"/>
				</Folio>
			</xsl:if>
			<xsl:if test="boolean(self::Section)">
				<Section>
					<xsl:value-of select="string(.)"/>
				</Section>
			</xsl:if>
			<xsl:if test="boolean(self::Volume)">
				<Volume>
					<xsl:value-of select="string(.)"/>
				</Volume>
			</xsl:if>
			<xsl:if test="boolean(self::AdditionalRegistrationData)">
				<AdditionalRegistrationData>
					<xsl:value-of select="string(.)"/>
				</AdditionalRegistrationData>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl5_AddressType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Address)">
				<Address>
					<xsl:value-of select="string(.)"/>
				</Address>
			</xsl:if>
			<xsl:if test="boolean(self::PostCode)">
				<PostCode>
					<xsl:value-of select="string(.)"/>
				</PostCode>
			</xsl:if>
			<xsl:if test="boolean(self::Town)">
				<Town>
					<xsl:value-of select="string(.)"/>
				</Town>
			</xsl:if>
			<xsl:if test="boolean(self::Province)">
				<Province>
					<xsl:value-of select="string(.)"/>
				</Province>
			</xsl:if>
			<xsl:if test="boolean(self::CountryCode)">
				<CountryCode>
					<xsl:value-of select="string(.)"/>
				</CountryCode>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl6_OverseasAddressType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Address)">
				<Address>
					<xsl:value-of select="string(.)"/>
				</Address>
			</xsl:if>
			<xsl:if test="boolean(self::PostCodeAndTown)">
				<PostCodeAndTown>
					<xsl:value-of select="string(.)"/>
				</PostCodeAndTown>
			</xsl:if>
			<xsl:if test="boolean(self::Province)">
				<Province>
					<xsl:value-of select="string(.)"/>
				</Province>
			</xsl:if>
			<xsl:if test="boolean(self::CountryCode)">
				<CountryCode>
					<xsl:value-of select="string(.)"/>
				</CountryCode>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl7_ContactDetailsType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Telephone)">
				<Telephone>
					<xsl:value-of select="string(.)"/>
				</Telephone>
			</xsl:if>
			<xsl:if test="boolean(self::TeleFax)">
				<TeleFax>
					<xsl:value-of select="string(.)"/>
				</TeleFax>
			</xsl:if>
			<xsl:if test="boolean(self::WebAddress)">
				<WebAddress>
					<xsl:value-of select="string(.)"/>
				</WebAddress>
			</xsl:if>
			<xsl:if test="boolean(self::ElectronicMail)">
				<ElectronicMail>
					<xsl:value-of select="string(.)"/>
				</ElectronicMail>
			</xsl:if>
			<xsl:if test="boolean(self::ContactPersons)">
				<ContactPersons>
					<xsl:value-of select="string(.)"/>
				</ContactPersons>
			</xsl:if>
			<xsl:if test="boolean(self::CnoCnae)">
				<CnoCnae>
					<xsl:value-of select="string(.)"/>
				</CnoCnae>
			</xsl:if>
			<xsl:if test="boolean(self::INETownCode)">
				<INETownCode>
					<xsl:value-of select="string(.)"/>
				</INETownCode>
			</xsl:if>
			<xsl:if test="boolean(self::AdditionalContactDetails)">
				<AdditionalContactDetails>
					<xsl:value-of select="string(.)"/>
				</AdditionalContactDetails>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl8_IndividualType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Name)">
				<Name>
					<xsl:value-of select="string(.)"/>
				</Name>
			</xsl:if>
			<xsl:if test="boolean(self::FirstSurname)">
				<FirstSurname>
					<xsl:value-of select="string(.)"/>
				</FirstSurname>
			</xsl:if>
			<xsl:if test="boolean(self::SecondSurname)">
				<SecondSurname>
					<xsl:value-of select="string(.)"/>
				</SecondSurname>
			</xsl:if>
			<xsl:if test="boolean(self::AddressInSpain)">
				<AddressInSpain>
					<xsl:call-template name="tmpl5_AddressType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</AddressInSpain>
			</xsl:if>
			<xsl:if test="boolean(self::OverseasAddress)">
				<OverseasAddress>
					<xsl:call-template name="tmpl6_OverseasAddressType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</OverseasAddress>
			</xsl:if>
			<xsl:if test="boolean(self::ContactDetails)">
				<ContactDetails>
					<xsl:call-template name="tmpl7_ContactDetailsType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</ContactDetails>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl9_BatchType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::BatchIdentifier)">
				<BatchIdentifier>
					<xsl:value-of select="string(.)"/>
				</BatchIdentifier>
			</xsl:if>
			<xsl:if test="boolean(self::InvoicesCount)">
				<InvoicesCount>
					<xsl:value-of select="string(.)"/>
				</InvoicesCount>
			</xsl:if>
			<xsl:if test="boolean(self::TotalInvoicesAmount)">
				<TotalInvoicesAmount>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TotalInvoicesAmount>
			</xsl:if>
			<xsl:if test="boolean(self::TotalOutstandingAmount)">
				<TotalOutstandingAmount>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TotalOutstandingAmount>
			</xsl:if>
			<xsl:if test="boolean(self::TotalExecutableAmount)">
				<TotalExecutableAmount>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TotalExecutableAmount>
			</xsl:if>
			<xsl:if test="boolean(self::InvoiceCurrencyCode)">
				<InvoiceCurrencyCode>
					<xsl:value-of select="string(.)"/>
				</InvoiceCurrencyCode>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl10_AmountType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::TotalAmount)">
				<TotalAmount>
					<xsl:value-of select="string(.)"/>
				</TotalAmount>
			</xsl:if>
			<xsl:if test="boolean(self::EquivalentInEuros)">
				<EquivalentInEuros>
					<xsl:value-of select="string(.)"/>
				</EquivalentInEuros>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl11_AssigneeType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::TaxIdentification)">
				<TaxIdentification>
					<xsl:call-template name="tmpl2_TaxIdentificationType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TaxIdentification>
			</xsl:if>
			<xsl:if test="boolean(self::LegalEntity)">
				<LegalEntity>
					<xsl:call-template name="tmpl3_LegalEntityType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</LegalEntity>
			</xsl:if>
			<xsl:if test="boolean(self::Individual)">
				<Individual>
					<xsl:call-template name="tmpl8_IndividualType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</Individual>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl12_PeriodDates">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::StartDate)">
				<StartDate>
					<xsl:value-of select="string(.)"/>
				</StartDate>
			</xsl:if>
			<xsl:if test="boolean(self::EndDate)">
				<EndDate>
					<xsl:value-of select="string(.)"/>
				</EndDate>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl13_InvoiceIssueDataType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::IssueDate)">
				<IssueDate>
					<xsl:value-of select="string(.)"/>
				</IssueDate>
			</xsl:if>
			<xsl:if test="boolean(self::OperationDate)">
				<OperationDate>
					<xsl:value-of select="string(.)"/>
				</OperationDate>
			</xsl:if>
			<xsl:if test="boolean(self::PlaceOfIssue)">
				<PlaceOfIssue>
					<xsl:call-template name="tmpl14_PlaceOfIssueType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</PlaceOfIssue>
			</xsl:if>
			<xsl:if test="boolean(self::InvoicingPeriod)">
				<InvoicingPeriod>
					<xsl:call-template name="tmpl12_PeriodDates">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</InvoicingPeriod>
			</xsl:if>
			<xsl:if test="boolean(self::InvoiceCurrencyCode)">
				<InvoiceCurrencyCode>
					<xsl:value-of select="string(.)"/>
				</InvoiceCurrencyCode>
			</xsl:if>
			<xsl:if test="boolean(self::ExchangeRateDetails)">
				<ExchangeRateDetails>
					<xsl:call-template name="tmpl15_ExchangeRateDetailsType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</ExchangeRateDetails>
			</xsl:if>
			<xsl:if test="boolean(self::TaxCurrencyCode)">
				<TaxCurrencyCode>
					<xsl:value-of select="string(.)"/>
				</TaxCurrencyCode>
			</xsl:if>
			<xsl:if test="boolean(self::LanguageName)">
				<LanguageName>
					<xsl:value-of select="string(.)"/>
				</LanguageName>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl14_PlaceOfIssueType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::PostCode)">
				<PostCode>
					<xsl:value-of select="string(.)"/>
				</PostCode>
			</xsl:if>
			<xsl:if test="boolean(self::PlaceOfIssueDescription)">
				<PlaceOfIssueDescription>
					<xsl:value-of select="string(.)"/>
				</PlaceOfIssueDescription>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl15_ExchangeRateDetailsType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::ExchangeRate)">
				<ExchangeRate>
					<xsl:value-of select="string(.)"/>
				</ExchangeRate>
			</xsl:if>
			<xsl:if test="boolean(self::ExchangeRateDate)">
				<ExchangeRateDate>
					<xsl:value-of select="string(.)"/>
				</ExchangeRateDate>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl16_">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Tax)">
				<Tax>
					<xsl:call-template name="tmpl17_TaxOutputType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</Tax>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl17_TaxOutputType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::TaxTypeCode)">
				<TaxTypeCode>
					<xsl:value-of select="string(.)"/>
				</TaxTypeCode>
			</xsl:if>
			<xsl:if test="boolean(self::TaxRate)">
				<TaxRate>
					<xsl:value-of select="string(.)"/>
				</TaxRate>
			</xsl:if>
			<xsl:if test="boolean(self::TaxableBase)">
				<TaxableBase>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TaxableBase>
			</xsl:if>
			<xsl:if test="boolean(self::TaxAmount)">
				<TaxAmount>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TaxAmount>
			</xsl:if>
			<xsl:if test="boolean(self::SpecialTaxableBase)">
				<SpecialTaxableBase>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</SpecialTaxableBase>
			</xsl:if>
			<xsl:if test="boolean(self::SpecialTaxAmount)">
				<SpecialTaxAmount>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</SpecialTaxAmount>
			</xsl:if>
			<xsl:if test="boolean(self::EquivalenceSurcharge)">
				<EquivalenceSurcharge>
					<xsl:value-of select="string(.)"/>
				</EquivalenceSurcharge>
			</xsl:if>
			<xsl:if test="boolean(self::EquivalenceSurchargeAmount)">
				<EquivalenceSurchargeAmount>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</EquivalenceSurchargeAmount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl18_TaxesType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Tax)">
				<Tax>
					<xsl:call-template name="tmpl19_TaxType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</Tax>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl19_TaxType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::TaxTypeCode)">
				<TaxTypeCode>
					<xsl:value-of select="string(.)"/>
				</TaxTypeCode>
			</xsl:if>
			<xsl:if test="boolean(self::TaxRate)">
				<TaxRate>
					<xsl:value-of select="string(.)"/>
				</TaxRate>
			</xsl:if>
			<xsl:if test="boolean(self::TaxableBase)">
				<TaxableBase>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TaxableBase>
			</xsl:if>
			<xsl:if test="boolean(self::TaxAmount)">
				<TaxAmount>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TaxAmount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl20_InvoiceTotalsType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::TotalGrossAmount)">
				<TotalGrossAmount>
					<xsl:value-of select="string(.)"/>
				</TotalGrossAmount>
			</xsl:if>
			<xsl:if test="boolean(self::GeneralDiscounts)">
				<GeneralDiscounts>
					<xsl:call-template name="tmpl21_DiscountsAndRebatesType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</GeneralDiscounts>
			</xsl:if>
			<xsl:if test="boolean(self::GeneralSurcharges)">
				<GeneralSurcharges>
					<xsl:call-template name="tmpl23_ChargesType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</GeneralSurcharges>
			</xsl:if>
			<xsl:if test="boolean(self::TotalGeneralDiscounts)">
				<TotalGeneralDiscounts>
					<xsl:value-of select="string(.)"/>
				</TotalGeneralDiscounts>
			</xsl:if>
			<xsl:if test="boolean(self::TotalGeneralSurcharges)">
				<TotalGeneralSurcharges>
					<xsl:value-of select="string(.)"/>
				</TotalGeneralSurcharges>
			</xsl:if>
			<xsl:if test="boolean(self::TotalGrossAmountBeforeTaxes)">
				<TotalGrossAmountBeforeTaxes>
					<xsl:value-of select="string(.)"/>
				</TotalGrossAmountBeforeTaxes>
			</xsl:if>
			<xsl:if test="boolean(self::TotalTaxOutputs)">
				<TotalTaxOutputs>
					<xsl:value-of select="string(.)"/>
				</TotalTaxOutputs>
			</xsl:if>
			<xsl:if test="boolean(self::TotalTaxesWithheld)">
				<TotalTaxesWithheld>
					<xsl:value-of select="string(.)"/>
				</TotalTaxesWithheld>
			</xsl:if>
			<xsl:if test="boolean(self::InvoiceTotal)">
				<InvoiceTotal>
					<xsl:value-of select="string(.)"/>
				</InvoiceTotal>
			</xsl:if>
			<xsl:if test="boolean(self::Subsidies)">
				<Subsidies>
					<xsl:call-template name="tmpl25_SubsidiesType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</Subsidies>
			</xsl:if>
			<xsl:if test="boolean(self::PaymentsOnAccount)">
				<PaymentsOnAccount>
					<xsl:call-template name="tmpl27_PaymentsOnAccountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</PaymentsOnAccount>
			</xsl:if>
			<xsl:if test="boolean(self::ReimbursableExpenses)">
				<ReimbursableExpenses>
					<xsl:call-template name="tmpl29_ReimbursableExpenses">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</ReimbursableExpenses>
			</xsl:if>
			<xsl:if test="boolean(self::TotalFinancialExpenses)">
				<TotalFinancialExpenses>
					<xsl:value-of select="string(.)"/>
				</TotalFinancialExpenses>
			</xsl:if>
			<xsl:if test="boolean(self::TotalOutstandingAmount)">
				<TotalOutstandingAmount>
					<xsl:value-of select="string(.)"/>
				</TotalOutstandingAmount>
			</xsl:if>
			<xsl:if test="boolean(self::TotalPaymentsOnAccount)">
				<TotalPaymentsOnAccount>
					<xsl:value-of select="string(.)"/>
				</TotalPaymentsOnAccount>
			</xsl:if>
			<xsl:if test="boolean(self::AmountsWithheld)">
				<AmountsWithheld>
					<xsl:call-template name="tmpl31_AmountsWithheldType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</AmountsWithheld>
			</xsl:if>
			<xsl:if test="boolean(self::TotalExecutableAmount)">
				<TotalExecutableAmount>
					<xsl:value-of select="string(.)"/>
				</TotalExecutableAmount>
			</xsl:if>
			<xsl:if test="boolean(self::TotalReimbursableExpenses)">
				<TotalReimbursableExpenses>
					<xsl:value-of select="string(.)"/>
				</TotalReimbursableExpenses>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl21_DiscountsAndRebatesType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Discount)">
				<Discount>
					<xsl:call-template name="tmpl22_DiscountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</Discount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl22_DiscountType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::DiscountReason)">
				<DiscountReason>
					<xsl:value-of select="string(.)"/>
				</DiscountReason>
			</xsl:if>
			<xsl:if test="boolean(self::DiscountRate)">
				<DiscountRate>
					<xsl:value-of select="string(.)"/>
				</DiscountRate>
			</xsl:if>
			<xsl:if test="boolean(self::DiscountAmount)">
				<DiscountAmount>
					<xsl:value-of select="format-number(number(string(.)), '#0.00', 'decimal')"/>
				</DiscountAmount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl23_ChargesType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Charge)">
				<Charge>
					<xsl:call-template name="tmpl24_ChargeType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</Charge>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl24_ChargeType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::ChargeReason)">
				<ChargeReason>
					<xsl:value-of select="string(.)"/>
				</ChargeReason>
			</xsl:if>
			<xsl:if test="boolean(self::ChargeRate)">
				<ChargeRate>
					<xsl:value-of select="string(.)"/>
				</ChargeRate>
			</xsl:if>
			<xsl:if test="boolean(self::ChargeAmount)">
				<ChargeAmount>
					<xsl:value-of select="format-number(number(string(.)), '#0.00', 'decimal')"/>
				</ChargeAmount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl25_SubsidiesType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Subsidy)">
				<Subsidy>
					<xsl:call-template name="tmpl26_SubsidyType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</Subsidy>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl26_SubsidyType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::SubsidyDescription)">
				<SubsidyDescription>
					<xsl:value-of select="string(.)"/>
				</SubsidyDescription>
			</xsl:if>
			<xsl:if test="boolean(self::SubsidyRate)">
				<SubsidyRate>
					<xsl:value-of select="string(.)"/>
				</SubsidyRate>
			</xsl:if>
			<xsl:if test="boolean(self::SubsidyAmount)">
				<SubsidyAmount>
					<xsl:value-of select="string(.)"/>
				</SubsidyAmount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl27_PaymentsOnAccountType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::PaymentOnAccount)">
				<PaymentOnAccount>
					<xsl:call-template name="tmpl28_PaymentOnAccountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</PaymentOnAccount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl28_PaymentOnAccountType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::PaymentOnAccountDate)">
				<PaymentOnAccountDate>
					<xsl:value-of select="string(.)"/>
				</PaymentOnAccountDate>
			</xsl:if>
			<xsl:if test="boolean(self::PaymentOnAccountAmount)">
				<PaymentOnAccountAmount>
					<xsl:value-of select="string(.)"/>
				</PaymentOnAccountAmount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl29_ReimbursableExpenses">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::ReimbursableExpenses)">
				<ReimbursableExpenses>
					<xsl:call-template name="tmpl30_ReimbursableExpensesType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</ReimbursableExpenses>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl30_ReimbursableExpensesType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::ReimbursableExpensesSellerParty)">
				<ReimbursableExpensesSellerParty>
					<xsl:call-template name="tmpl2_TaxIdentificationType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</ReimbursableExpensesSellerParty>
			</xsl:if>
			<xsl:if test="boolean(self::ReimbursableExpensesBuyerParty)">
				<ReimbursableExpensesBuyerParty>
					<xsl:call-template name="tmpl2_TaxIdentificationType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</ReimbursableExpensesBuyerParty>
			</xsl:if>
			<xsl:if test="boolean(self::IssueDate)">
				<IssueDate>
					<xsl:value-of select="string(.)"/>
				</IssueDate>
			</xsl:if>
			<xsl:if test="boolean(self::InvoiceNumber)">
				<InvoiceNumber>
					<xsl:value-of select="string(.)"/>
				</InvoiceNumber>
			</xsl:if>
			<xsl:if test="boolean(self::InvoiceSeriesCode)">
				<InvoiceSeriesCode>
					<xsl:value-of select="string(.)"/>
				</InvoiceSeriesCode>
			</xsl:if>
			<xsl:if test="boolean(self::ReimbursableExpensesAmount)">
				<ReimbursableExpensesAmount>
					<xsl:value-of select="string(.)"/>
				</ReimbursableExpensesAmount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl31_AmountsWithheldType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::WithholdingReason)">
				<WithholdingReason>
					<xsl:value-of select="string(.)"/>
				</WithholdingReason>
			</xsl:if>
			<xsl:if test="boolean(self::WithholdingRate)">
				<WithholdingRate>
					<xsl:value-of select="string(.)"/>
				</WithholdingRate>
			</xsl:if>
			<xsl:if test="boolean(self::WithholdingAmount)">
				<WithholdingAmount>
					<xsl:value-of select="string(.)"/>
				</WithholdingAmount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl32_">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Tax)">
				<Tax>
					<xsl:call-template name="tmpl33_">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</Tax>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl33_">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::TaxTypeCode)">
				<TaxTypeCode>
					<xsl:value-of select="string(.)"/>
				</TaxTypeCode>
			</xsl:if>
			<xsl:if test="boolean(self::TaxRate)">
				<TaxRate>
					<xsl:value-of select="string(.)"/>
				</TaxRate>
			</xsl:if>
			<xsl:if test="boolean(self::TaxableBase)">
				<TaxableBase>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TaxableBase>
			</xsl:if>
			<xsl:if test="boolean(self::TaxAmount)">
				<TaxAmount>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</TaxAmount>
			</xsl:if>
			<xsl:if test="boolean(self::SpecialTaxableBase)">
				<SpecialTaxableBase>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</SpecialTaxableBase>
			</xsl:if>
			<xsl:if test="boolean(self::SpecialTaxAmount)">
				<SpecialTaxAmount>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</SpecialTaxAmount>
			</xsl:if>
			<xsl:if test="boolean(self::EquivalenceSurcharge)">
				<EquivalenceSurcharge>
					<xsl:value-of select="string(.)"/>
				</EquivalenceSurcharge>
			</xsl:if>
			<xsl:if test="boolean(self::EquivalenceSurchargeAmount)">
				<EquivalenceSurchargeAmount>
					<xsl:call-template name="tmpl10_AmountType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</EquivalenceSurchargeAmount>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl34_LegalLiteralsType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::LegalReference)">
				<LegalReference>
					<xsl:value-of select="string(.)"/>
				</LegalReference>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl35_AdditionalDataType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::RelatedInvoice)">
				<RelatedInvoice>
					<xsl:value-of select="string(.)"/>
				</RelatedInvoice>
			</xsl:if>
			<xsl:if test="boolean(self::RelatedDocuments)">
				<RelatedDocuments>
					<xsl:call-template name="tmpl36_AttachedDocumentsType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</RelatedDocuments>
			</xsl:if>
			<xsl:if test="boolean(self::InvoiceAdditionalInformation)">
				<InvoiceAdditionalInformation>
					<xsl:value-of select="string(.)"/>
				</InvoiceAdditionalInformation>
			</xsl:if>
			<xsl:if test="boolean(self::Extensions)">
				<xsl:copy-of select="."/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl36_AttachedDocumentsType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::Attachment)">
				<Attachment>
					<xsl:call-template name="tmpl37_AttachmentType">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</Attachment>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmpl37_AttachmentType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
			<xsl:if test="boolean(self::AttachmentCompressionAlgorithm)">
				<AttachmentCompressionAlgorithm>
					<xsl:value-of select="string(.)"/>
				</AttachmentCompressionAlgorithm>
			</xsl:if>
			<xsl:if test="boolean(self::AttachmentFormat)">
				<AttachmentFormat>
					<xsl:value-of select="string(.)"/>
				</AttachmentFormat>
			</xsl:if>
			<xsl:if test="boolean(self::AttachmentEncoding)">
				<AttachmentEncoding>
					<xsl:value-of select="string(.)"/>
				</AttachmentEncoding>
			</xsl:if>
			<xsl:if test="boolean(self::AttachmentDescription)">
				<AttachmentDescription>
					<xsl:value-of select="string(.)"/>
				</AttachmentDescription>
			</xsl:if>
			<xsl:if test="boolean(self::AttachmentData)">
				<AttachmentData>
					<xsl:value-of select="string(.)"/>
				</AttachmentData>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmplAccountType">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
				<xsl:if test="boolean(self::IBAN)">
					<IBAN>
						<xsl:value-of select="string(.)"/>
					</IBAN>
				</xsl:if>
				<xsl:if test="boolean(self::AccountNumber)">
					<AccountNumber>
						<xsl:value-of select="string(.)"/>
					</AccountNumber>
				</xsl:if>
				<xsl:if test="boolean(self::BankCode)">
					<BankCode>
						<xsl:value-of select="string(.)"/>
					</BankCode>
				</xsl:if>
				<xsl:if test="boolean(self::BranchCode)">
					<BranchCode>
						<xsl:value-of select="string(.)"/>
					</BranchCode>
				</xsl:if>
				<xsl:if test="boolean(self::BranchInSpainAddress)">
					<BranchInSpainAddress>
						<xsl:call-template name="tmpl5_AddressType">
							<xsl:with-param name="input" select="."/>
						</xsl:call-template>
					</BranchInSpainAddress>
				</xsl:if>
				<xsl:if test="boolean(self::OverseasBranchAddress)">
					<OverseasBranchAddress>
						<xsl:call-template name="tmpl6_OverseasAddressType">
							<xsl:with-param name="input" select="."/>
						</xsl:call-template>
					</OverseasBranchAddress>
				</xsl:if>
				<xsl:if test="boolean(self::BIC)">
					<BIC>
						<xsl:value-of select="string(.)"/>
					</BIC>
				</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmplInstallment">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input">
		<xsl:if test="boolean(self::Installment)">
		<Installment>
				<xsl:if test="boolean(self::Installment/InstallmentDueDate)">
					<InstallmentDueDate>
						<xsl:value-of select="string(InstallmentDueDate)"/>
					</InstallmentDueDate>
				</xsl:if>
				<xsl:if test="boolean(self::Installment/InstallmentAmount)">
					<InstallmentAmount>
						<xsl:value-of select="string(InstallmentAmount)"/>
					</InstallmentAmount>
				</xsl:if>
				<xsl:if test="boolean(self::Installment/PaymentMeans)">
					<PaymentMeans>
						<xsl:value-of select="string(PaymentMeans)"/>
					</PaymentMeans>
				</xsl:if>
				<xsl:if test="boolean(self::Installment/AccountToBeCredited)">
					<AccountToBeCredited>
						<xsl:call-template name="tmplAccountType">
							<xsl:with-param name="input" select="AccountToBeCredited"/>
						</xsl:call-template>
					</AccountToBeCredited>
				</xsl:if>
				<xsl:if test="boolean(self::Installment/PaymentReconciliationReference)">
					<PaymentReconciliationReference>
						<xsl:value-of select="string(PaymentReconciliationReference)"/>
					</PaymentReconciliationReference>
				</xsl:if>
				<xsl:if test="boolean(self::Installment/AccountToBeDebited)">
					<AccountToBeDebited>
						<xsl:call-template name="tmplAccountType">
							<xsl:with-param name="input" select="AccountToBeDebited"/>
						</xsl:call-template>
					</AccountToBeDebited>
				</xsl:if>
				<xsl:if test="boolean(self::Installment/CollectionAdditionalInformation)">
					<CollectionAdditionalInformation>
						<xsl:value-of select="string(CollectionAdditionalInformation)"/>
					</CollectionAdditionalInformation>
				</xsl:if>
				<xsl:if test="boolean(self::Installment/RegulatoryReportingData)">
					<RegulatoryReportingData>
						<xsl:value-of select="string(RegulatoryReportingData)"/>
					</RegulatoryReportingData>
				</xsl:if>
				<xsl:if test="boolean(self::Installment/DebitReconciliationReference)">
					<DebitReconciliationReference>
						<xsl:value-of select="string(DebitReconciliationReference)"/>
					</DebitReconciliationReference>
				</xsl:if>
				</Installment>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tmplAdministrativeCentres">
		<xsl:param name="input" select="/.."/>
		<xsl:for-each select="$input/node()">
		<xsl:if test="boolean(self::AdministrativeCentre)">
			<AdministrativeCentre>
				<xsl:if test="boolean(self::AdministrativeCentre/CentreCode)">
					<CentreCode>
						<xsl:value-of select="string(CentreCode)" />
					</CentreCode>
				</xsl:if>
				<xsl:if test="boolean(self::AdministrativeCentre/RoleTypeCode)">
					<RoleTypeCode>
						<xsl:value-of select="string(RoleTypeCode)" />
					</RoleTypeCode>
				</xsl:if>
				<xsl:if test="boolean(self::AdministrativeCentre/Name)">
					<Name>
						<xsl:value-of select="string(Name)" />
					</Name>
				</xsl:if>
				<xsl:if test="boolean(self::AdministrativeCentre/FirstSurname)">
					<FirstSurname>
						<xsl:value-of select="string(FirstSurname)" />
					</FirstSurname>
				</xsl:if>
				<xsl:if test="boolean(self::AdministrativeCentre/SecondSurname)">
					<SecondSurname>
						<xsl:value-of select="string(SecondSurname)" />
					</SecondSurname>
				</xsl:if>
				<xsl:if test="boolean(self::AdministrativeCentre/AddressInSpain)">
					<AddressInSpain>
						<xsl:call-template name="tmpl5_AddressType">
							<xsl:with-param name="input" select="AddressInSpain" />
						</xsl:call-template>
					</AddressInSpain>
				</xsl:if>
				<xsl:if test="boolean(self::AdministrativeCentre/OverseasAddress)">
					<OverseasAddress>
						<xsl:call-template name="tmpl6_OverseasAddressType">
							<xsl:with-param name="input" select="OverseasAddress" />
						</xsl:call-template>
					</OverseasAddress>
				</xsl:if>
				<xsl:if test="boolean(self::AdministrativeCentre/ContactDetails)">
					<ContactDetails>
						<xsl:call-template name="tmpl7_ContactDetailsType">
							<xsl:with-param name="input" select="ContactDetails" />
						</xsl:call-template>
					</ContactDetails>
				</xsl:if>
				<xsl:if test="boolean(self::AdministrativeCentre/PhysicalGLN)">
					<PhysicalGLN>
						<xsl:value-of select="string(PhysicalGLN)" />
					</PhysicalGLN>
				</xsl:if>
				<xsl:if test="boolean(self::AdministrativeCentre/LogicalOperationalPoint)">
					<LogicalOperationalPoint>
						<xsl:value-of select="string(LogicalOperationalPoint)" />
					</LogicalOperationalPoint>
				</xsl:if>
				<xsl:if test="boolean(self::AdministrativeCentre/CentreDescription)">
					<CentreDescription>
						<xsl:value-of select="string(CentreDescription)" />
					</CentreDescription>
				</xsl:if>
				</AdministrativeCentre>
				</xsl:if>
		</xsl:for-each>	
	</xsl:template>
		
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<fe:Facturae xmlns:fe="http://www.facturae.es/Facturae/2014/v3.2.1/Facturae" xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance">
				<xsl:value-of select="'http://www.facturae.es/Facturae/2014/v3.2.1/Facturae'"/>
			</xsl:attribute>
			<xsl:for-each select="fe32:Facturae">
				<xsl:variable name="var1_FileHeader" select="*[local-name()='FileHeader' and namespace-uri()='']"/>
				<xsl:variable name="var2_Parties" select="*[local-name()='Parties' and namespace-uri()='']"/>
				<xsl:variable name="var3_SellerParty" select="$var2_Parties/*[local-name()='SellerParty' and namespace-uri()='']"/>
				<xsl:variable name="var4_BuyerParty" select="$var2_Parties/*[local-name()='BuyerParty' and namespace-uri()='']"/>
				<FileHeader xmlns="">
					<SchemaVersion>
						<xsl:value-of select="'3.2.1'"/>
					</SchemaVersion>
					<Modality>
						<xsl:value-of select="string($var1_FileHeader/Modality)"/>
					</Modality>
					<InvoiceIssuerType>
						<xsl:value-of select="string($var1_FileHeader/InvoiceIssuerType)"/>
					</InvoiceIssuerType>
					<xsl:for-each select="$var1_FileHeader/ThirdParty">
						<ThirdParty>
							<xsl:call-template name="tmpl1_ThirdPartyType">
								<xsl:with-param name="input" select="."/>
							</xsl:call-template>
						</ThirdParty>
					</xsl:for-each>
					<Batch>
						<xsl:call-template name="tmpl9_BatchType">
							<xsl:with-param name="input" select="$var1_FileHeader/Batch"/>
						</xsl:call-template>
					</Batch>
					<xsl:for-each select="$var1_FileHeader/FactoringAssignmentData">
						<FactoringAssignmentData>
						<xsl:variable name="var5_Installment" select="PaymentDetails/Installment"/>
							<Assignee>
								<xsl:call-template name="tmpl11_AssigneeType">
									<xsl:with-param name="input" select="Assignee"/>
								</xsl:call-template>
							</Assignee>
							<PaymentDetails>
								<xsl:call-template name="tmplInstallment">
									<xsl:with-param name="input" select="$var1_FileHeader/Installment"/>
								</xsl:call-template>
							</PaymentDetails>
							<FactoringAssignmentClauses>
								<xsl:value-of select="string(FactoringAssignmentClauses)"/>
							</FactoringAssignmentClauses>
						</FactoringAssignmentData>
					</xsl:for-each>
				</FileHeader>
				<Parties xmlns="">
					<SellerParty>
						<TaxIdentification>
							<xsl:call-template name="tmpl2_TaxIdentificationType">
								<xsl:with-param name="input" select="$var3_SellerParty/TaxIdentification"/>
							</xsl:call-template>
						</TaxIdentification>
						<xsl:for-each select="$var3_SellerParty/PartyIdentification">
							<PartyIdentification>
								<xsl:value-of select="string(.)"/>
							</PartyIdentification>
						</xsl:for-each>
						<xsl:for-each select="$var3_SellerParty/AdministrativeCentres">
							<AdministrativeCentres>
								<xsl:call-template name="tmplAdministrativeCentres">
									<xsl:with-param name="input" select="." />
								</xsl:call-template>
							</AdministrativeCentres>
						</xsl:for-each>
						<xsl:for-each select="$var3_SellerParty/LegalEntity">
							<LegalEntity>
								<xsl:call-template name="tmpl3_LegalEntityType">
									<xsl:with-param name="input" select="."/>
								</xsl:call-template>
							</LegalEntity>
						</xsl:for-each>
						<xsl:for-each select="$var3_SellerParty/Individual">
							<Individual>
								<xsl:call-template name="tmpl8_IndividualType">
									<xsl:with-param name="input" select="."/>
								</xsl:call-template>
							</Individual>
						</xsl:for-each>
					</SellerParty>
					<BuyerParty>
						<TaxIdentification>
							<xsl:call-template name="tmpl2_TaxIdentificationType">
								<xsl:with-param name="input" select="$var4_BuyerParty/TaxIdentification"/>
							</xsl:call-template>
						</TaxIdentification>
						<xsl:for-each select="$var4_BuyerParty/PartyIdentification">
							<PartyIdentification>
								<xsl:value-of select="string(.)"/>
							</PartyIdentification>
						</xsl:for-each>
						<xsl:for-each select="$var4_BuyerParty/AdministrativeCentres">
							<AdministrativeCentres>
								<xsl:call-template name="tmplAdministrativeCentres">
									<xsl:with-param name="input" select="." />
								</xsl:call-template>
							</AdministrativeCentres>
						</xsl:for-each>
						<xsl:for-each select="$var4_BuyerParty/LegalEntity">
							<LegalEntity>
								<xsl:call-template name="tmpl3_LegalEntityType">
									<xsl:with-param name="input" select="."/>
								</xsl:call-template>
							</LegalEntity>
						</xsl:for-each>
						<xsl:for-each select="$var4_BuyerParty/Individual">
							<Individual>
								<xsl:call-template name="tmpl8_IndividualType">
									<xsl:with-param name="input" select="."/>
								</xsl:call-template>
							</Individual>
						</xsl:for-each>
					</BuyerParty>
				</Parties>
				<Invoices xmlns="">
					<xsl:for-each select="Invoices/Invoice">
						<xsl:variable name="var6_InvoiceHeader" select="InvoiceHeader"/>
						<Invoice>
							<InvoiceHeader>
								<InvoiceNumber>
									<xsl:value-of select="string($var6_InvoiceHeader/InvoiceNumber)"/>
								</InvoiceNumber>
								<xsl:for-each select="$var6_InvoiceHeader/InvoiceSeriesCode">
									<InvoiceSeriesCode>
										<xsl:value-of select="string(.)"/>
									</InvoiceSeriesCode>
								</xsl:for-each>
								<InvoiceDocumentType>
									<xsl:value-of select="string($var6_InvoiceHeader/InvoiceDocumentType)"/>
								</InvoiceDocumentType>
								<InvoiceClass>
									<xsl:value-of select="string($var6_InvoiceHeader/InvoiceClass)"/>
								</InvoiceClass>
								<xsl:for-each select="$var6_InvoiceHeader/Corrective">
									<Corrective>
										<xsl:for-each select="InvoiceNumber">
											<InvoiceNumber>
												<xsl:value-of select="string(.)"/>
											</InvoiceNumber>
										</xsl:for-each>
										<xsl:for-each select="InvoiceSeriesCode">
											<InvoiceSeriesCode>
												<xsl:value-of select="string(.)"/>
											</InvoiceSeriesCode>
										</xsl:for-each>
										<ReasonCode>
											<xsl:value-of select="string(ReasonCode)"/>
										</ReasonCode>
										<ReasonDescription>
											<xsl:value-of select="string(ReasonDescription)"/>
										</ReasonDescription>
										<TaxPeriod>
											<xsl:call-template name="tmpl12_PeriodDates">
												<xsl:with-param name="input" select="TaxPeriod"/>
											</xsl:call-template>
										</TaxPeriod>
										<CorrectionMethod>
											<xsl:value-of select="string(CorrectionMethod)"/>
										</CorrectionMethod>
										<CorrectionMethodDescription>
											<xsl:value-of select="string(CorrectionMethodDescription)"/>
										</CorrectionMethodDescription>
										<AdditionalReasonDescription>
											<xsl:value-of select="string(AdditionalReasonDescription)"/>
										</AdditionalReasonDescription>
									</Corrective>
								</xsl:for-each>
							</InvoiceHeader>
							<InvoiceIssueData>
								<xsl:call-template name="tmpl13_InvoiceIssueDataType">
									<xsl:with-param name="input" select="InvoiceIssueData"/>
								</xsl:call-template>
							</InvoiceIssueData>
							<TaxesOutputs>
								<xsl:call-template name="tmpl16_">
									<xsl:with-param name="input" select="TaxesOutputs"/>
								</xsl:call-template>
							</TaxesOutputs>
							<xsl:for-each select="TaxesWithheld">
								<TaxesWithheld>
									<xsl:call-template name="tmpl18_TaxesType">
										<xsl:with-param name="input" select="."/>
									</xsl:call-template>
								</TaxesWithheld>
							</xsl:for-each>
							<InvoiceTotals>
								<xsl:call-template name="tmpl20_InvoiceTotalsType">
									<xsl:with-param name="input" select="InvoiceTotals"/>
								</xsl:call-template>
							</InvoiceTotals>
							<Items>
								<xsl:for-each select="Items/InvoiceLine">
									<InvoiceLine>
										<xsl:for-each select="IssuerContractReference">
											<IssuerContractReference>
												<xsl:value-of select="string(.)"/>
											</IssuerContractReference>
										</xsl:for-each>
										<xsl:if test="boolean(self::IssuerContractDate)">
											<IssuerContractDate>
												<xsl:value-of select="string(IssuerContractDate)"/>
											</IssuerContractDate>
										</xsl:if>
										<xsl:for-each select="IssuerTransactionReference">
											<IssuerTransactionReference>
												<xsl:value-of select="string(.)"/>
											</IssuerTransactionReference>
										</xsl:for-each>
										<xsl:if test="boolean(self::IssuerTransactionDate)">
											<IssuerTransactionDate>
												<xsl:value-of select="string(IssuerTransactionDate)"/>
											</IssuerTransactionDate>
										</xsl:if>
										<xsl:for-each select="ReceiverContractReference">
											<ReceiverContractReference>
												<xsl:value-of select="string(.)"/>
											</ReceiverContractReference>
										</xsl:for-each>
										<xsl:if test="boolean(self::ReceiverContractDate)">
											<ReceiverContractDate>
												<xsl:value-of select="string(ReceiverContractDate)"/>
											</ReceiverContractDate>
										</xsl:if>	
										<xsl:for-each select="ReceiverTransactionReference">
											<ReceiverTransactionReference>
												<xsl:value-of select="string(.)"/>
											</ReceiverTransactionReference>
										</xsl:for-each>
										<xsl:if test="boolean(self::ReceiverTransactionDate)">
											<ReceiverTransactionDate>
												<xsl:value-of select="string(ReceiverTransactionDate)"/>
											</ReceiverTransactionDate>
										</xsl:if>
										<xsl:if test="boolean(self::FileReference)">
											<FileReference>
												<xsl:value-of select="string(FileReference)"/>
											</FileReference>
										</xsl:if>
										<xsl:if test="boolean(self::FileDate)">
											<FileDate>
												<xsl:value-of select="string(FileDate)"/>
											</FileDate>
										</xsl:if>
										<xsl:for-each select="SequenceNumber">
											<SequenceNumber>
												<xsl:value-of select="string(.)"/>
											</SequenceNumber>
										</xsl:for-each>
										<xsl:for-each select="DeliveryNotesReferences">
											<DeliveryNotesReferences>
												<xsl:for-each select="DeliveryNote">
													<DeliveryNote>
														<DeliveryNoteNumber>
															<xsl:value-of select="string(DeliveryNoteNumber)"/>
														</DeliveryNoteNumber>
														<DeliveryDate>
															<xsl:value-of select="string(DeliveryDate)"/>
														</DeliveryDate>
													</DeliveryNote>
												</xsl:for-each>
											</DeliveryNotesReferences>
										</xsl:for-each>
										<ItemDescription>
											<xsl:value-of select="string(ItemDescription)"/>
										</ItemDescription>
										<Quantity>
											<xsl:value-of select="string(Quantity)"/>
										</Quantity>
										<xsl:for-each select="UnitOfMeasure">
											<UnitOfMeasure>
												<xsl:value-of select="string(.)"/>
											</UnitOfMeasure>
										</xsl:for-each>
										<UnitPriceWithoutTax>
											<xsl:value-of select="string(UnitPriceWithoutTax)"/>
										</UnitPriceWithoutTax>
										<TotalCost>
											<xsl:value-of select="format-number(number(string(TotalCost)), '#0.00', 'decimal')"/>
										</TotalCost>
										<xsl:for-each select="DiscountsAndRebates">
											<DiscountsAndRebates>
												<xsl:call-template name="tmpl21_DiscountsAndRebatesType">
													<xsl:with-param name="input" select="."/>
												</xsl:call-template>
											</DiscountsAndRebates>
										</xsl:for-each>
										<xsl:for-each select="Charges">
											<Charges>
												<xsl:call-template name="tmpl23_ChargesType">
													<xsl:with-param name="input" select="."/>
												</xsl:call-template>
											</Charges>
										</xsl:for-each>
										<GrossAmount>
											<xsl:value-of select="format-number(number(string(GrossAmount)), '#0.00', 'decimal')"/>
										</GrossAmount>
										<xsl:for-each select="TaxesWithheld">
											<TaxesWithheld>
												<xsl:call-template name="tmpl18_TaxesType">
													<xsl:with-param name="input" select="."/>
												</xsl:call-template>
											</TaxesWithheld>
										</xsl:for-each>
										<TaxesOutputs>
											<xsl:call-template name="tmpl32_">
												<xsl:with-param name="input" select="TaxesOutputs"/>
											</xsl:call-template>
										</TaxesOutputs>
										<xsl:for-each select="LineItemPeriod">
											<LineItemPeriod>
												<xsl:call-template name="tmpl12_PeriodDates">
													<xsl:with-param name="input" select="."/>
												</xsl:call-template>
											</LineItemPeriod>
										</xsl:for-each>
										<xsl:for-each select="TransactionDate">
											<TransactionDate>
												<xsl:value-of select="string(.)"/>
											</TransactionDate>
										</xsl:for-each>
										<xsl:for-each select="AdditionalLineItemInformation">
											<AdditionalLineItemInformation>
												<xsl:value-of select="string(.)"/>
											</AdditionalLineItemInformation>
										</xsl:for-each>
										<xsl:if test="boolean(self::SpecialTaxableEvent)">
											<SpecialTaxableEvent>
												<SpecialTaxableEventCode>
													<xsl:value-of select="string(SpecialTaxableEventCode)" />
												</SpecialTaxableEventCode>
												<SpecialTaxableEventReason>
													<xsl:value-of select="string(SpecialTaxableEventReason)" />
												</SpecialTaxableEventReason>
											</SpecialTaxableEvent>
										</xsl:if>
										<xsl:if test="boolean(self::ArticleCode)">
											<ArticleCode>
												<xsl:value-of select="string(.)"/>
											</ArticleCode>
										</xsl:if>
										<xsl:for-each select="Extensions">
											<xsl:copy-of select="."/>
										</xsl:for-each>
									</InvoiceLine>
								</xsl:for-each>
							</Items>
							<xsl:for-each select="PaymentDetails">
								<PaymentDetails>
									<xsl:for-each select="Installment">
											<xsl:call-template name="tmplInstallment">
												<xsl:with-param name="input" select="."/>
											</xsl:call-template>
									</xsl:for-each>
								</PaymentDetails>
							</xsl:for-each>
							<xsl:for-each select="LegalLiterals">
								<LegalLiterals>
									<xsl:call-template name="tmpl34_LegalLiteralsType">
										<xsl:with-param name="input" select="."/>
									</xsl:call-template>
								</LegalLiterals>
							</xsl:for-each>
							<xsl:for-each select="AdditionalData">
								<AdditionalData>
									<xsl:call-template name="tmpl35_AdditionalDataType">
										<xsl:with-param name="input" select="."/>
									</xsl:call-template>
								</AdditionalData>
							</xsl:for-each>
						</Invoice>
					</xsl:for-each>
				</Invoices>
				<xsl:for-each select="*[local-name()='Extensions' and namespace-uri()='']">
					<xsl:copy-of select="."/>
				</xsl:for-each>
			</xsl:for-each>
		</fe:Facturae>
	</xsl:template>
</xsl:stylesheet>
