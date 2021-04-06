# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models



class Addresses(models.Model):
    npi = models.ForeignKey('Npi', models.DO_NOTHING, db_column='npi')
    line_1 = models.CharField(max_length=55, blank=True, null=True)
    line_2 = models.CharField(max_length=55, blank=True, null=True)
    city = models.CharField(max_length=40, blank=True, null=True)
    state = models.CharField(max_length=40, blank=True, null=True)
    postal = models.CharField(max_length=20, blank=True, null=True)
    country = models.CharField(max_length=2, blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    fax = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'addresses'


class CoreNpi(models.Model):
    npi = models.IntegerField(unique=True)
    last_name = models.TextField(blank=True, null=True)
    first_name = models.TextField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    state = models.TextField(blank=True, null=True)
    city = models.TextField(blank=True, null=True)
    zip = models.TextField(blank=True, null=True)
    addr_first = models.TextField(blank=True, null=True)
    addr_last = models.TextField(blank=True, null=True)
    phone = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'core_npi'

class Npi(models.Model):
    npi = models.IntegerField(unique=True)
    entity_type = models.IntegerField(blank=True, null=True)
    repl_npi = models.IntegerField(blank=True, null=True)
    ein = models.CharField(max_length=9, blank=True, null=True)
    org_name = models.CharField(max_length=70, blank=True, null=True)
    last_name = models.CharField(max_length=35, blank=True, null=True)
    first_name = models.CharField(max_length=20, blank=True, null=True)
    middle_name = models.CharField(max_length=20, blank=True, null=True)
    name_prefix = models.CharField(max_length=5, blank=True, null=True)
    name_suffix = models.CharField(max_length=5, blank=True, null=True)
    credentials = models.CharField(max_length=20, blank=True, null=True)
    other_org_name = models.CharField(max_length=70, blank=True, null=True)
    other_org_name_type = models.CharField(max_length=1, blank=True, null=True)
    other_last_name = models.CharField(max_length=35, blank=True, null=True)
    other_first_name = models.CharField(max_length=20, blank=True, null=True)
    other_middle_name = models.CharField(max_length=20, blank=True, null=True)
    other_name_prefix = models.CharField(max_length=5, blank=True, null=True)
    other_name_suffix = models.CharField(max_length=5, blank=True, null=True)
    other_credential = models.CharField(max_length=20, blank=True, null=True)
    other_last_name_code = models.TextField(blank=True, null=True)
    addr_mail_first = models.CharField(max_length=55, blank=True, null=True)
    addr_mail_second = models.CharField(max_length=55, blank=True, null=True)
    addr_mail_city = models.CharField(max_length=40, blank=True, null=True)
    addr_mail_state = models.CharField(max_length=40, blank=True, null=True)
    addr_mail_postal = models.CharField(max_length=20, blank=True, null=True)
    addr_mail_country = models.CharField(max_length=2, blank=True, null=True)
    addr_mail_phone = models.CharField(max_length=20, blank=True, null=True)
    addr_mail_fax = models.CharField(max_length=20, blank=True, null=True)
    addr_practice_first = models.CharField(max_length=55, blank=True, null=True)
    addr_practice_second = models.CharField(max_length=55, blank=True, null=True)
    addr_practice_city = models.CharField(max_length=40, blank=True, null=True)
    addr_practice_state = models.CharField(max_length=40, blank=True, null=True)
    addr_practice_postal = models.CharField(max_length=20, blank=True, null=True)
    addr_practice_country = models.CharField(max_length=2, blank=True, null=True)
    addr_practice_phone = models.CharField(max_length=20, blank=True, null=True)
    addr_practice_fax = models.CharField(max_length=20, blank=True, null=True)
    enumeration_date = models.DateField(blank=True, null=True)
    last_update = models.DateField(blank=True, null=True)
    deactivate_reason = models.CharField(max_length=2, blank=True, null=True)
    deactivate_date = models.DateField(blank=True, null=True)
    reactivate_date = models.DateField(blank=True, null=True)
    gender = models.CharField(max_length=1, blank=True, null=True)
    off_last_name = models.CharField(max_length=35, blank=True, null=True)
    off_first_name = models.CharField(max_length=20, blank=True, null=True)
    off_middle_name = models.CharField(max_length=20, blank=True, null=True)
    off_title = models.CharField(max_length=35, blank=True, null=True)
    off_phone = models.CharField(max_length=20, blank=True, null=True)
    taxonomy_1 = models.CharField(max_length=10, blank=True, null=True)
    license_num_1 = models.CharField(max_length=20, blank=True, null=True)
    license_state_1 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_1 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_2 = models.CharField(max_length=10, blank=True, null=True)
    license_num_2 = models.CharField(max_length=20, blank=True, null=True)
    license_state_2 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_2 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_3 = models.CharField(max_length=10, blank=True, null=True)
    license_num_3 = models.CharField(max_length=20, blank=True, null=True)
    license_state_3 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_3 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_4 = models.CharField(max_length=10, blank=True, null=True)
    license_num_4 = models.CharField(max_length=20, blank=True, null=True)
    license_state_4 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_4 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_5 = models.CharField(max_length=10, blank=True, null=True)
    license_num_5 = models.CharField(max_length=20, blank=True, null=True)
    license_state_5 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_5 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_6 = models.CharField(max_length=10, blank=True, null=True)
    license_num_6 = models.CharField(max_length=20, blank=True, null=True)
    license_state_6 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_6 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_7 = models.CharField(max_length=10, blank=True, null=True)
    license_num_7 = models.CharField(max_length=20, blank=True, null=True)
    license_state_7 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_7 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_8 = models.CharField(max_length=10, blank=True, null=True)
    license_num_8 = models.CharField(max_length=20, blank=True, null=True)
    license_state_8 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_8 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_9 = models.CharField(max_length=10, blank=True, null=True)
    license_num_9 = models.CharField(max_length=20, blank=True, null=True)
    license_state_9 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_9 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_10 = models.CharField(max_length=10, blank=True, null=True)
    license_num_10 = models.CharField(max_length=20, blank=True, null=True)
    license_state_10 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_10 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_11 = models.CharField(max_length=10, blank=True, null=True)
    license_num_11 = models.CharField(max_length=20, blank=True, null=True)
    license_state_11 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_11 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_12 = models.CharField(max_length=10, blank=True, null=True)
    license_num_12 = models.CharField(max_length=20, blank=True, null=True)
    license_state_12 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_12 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_13 = models.CharField(max_length=10, blank=True, null=True)
    license_num_13 = models.CharField(max_length=20, blank=True, null=True)
    license_state_13 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_13 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_14 = models.CharField(max_length=10, blank=True, null=True)
    license_num_14 = models.CharField(max_length=20, blank=True, null=True)
    license_state_14 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_14 = models.CharField(max_length=1, blank=True, null=True)
    taxonomy_15 = models.CharField(max_length=10, blank=True, null=True)
    license_num_15 = models.CharField(max_length=20, blank=True, null=True)
    license_state_15 = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch_15 = models.CharField(max_length=1, blank=True, null=True)
    other_identifier_1 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_1 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_1 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_1 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_2 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_2 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_2 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_2 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_3 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_3 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_3 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_3 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_4 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_4 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_4 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_4 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_5 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_5 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_5 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_5 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_6 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_6 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_6 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_6 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_7 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_7 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_7 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_7 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_8 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_8 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_8 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_8 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_9 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_9 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_9 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_9 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_10 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_10 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_10 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_10 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_11 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_11 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_11 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_11 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_12 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_12 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_12 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_12 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_13 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_13 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_13 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_13 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_14 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_14 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_14 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_14 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_15 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_15 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_15 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_15 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_16 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_16 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_16 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_16 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_17 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_17 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_17 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_17 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_18 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_18 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_18 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_18 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_19 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_19 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_19 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_19 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_20 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_20 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_20 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_20 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_21 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_21 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_21 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_21 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_22 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_22 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_22 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_22 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_23 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_23 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_23 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_23 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_24 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_24 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_24 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_24 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_25 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_25 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_25 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_25 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_26 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_26 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_26 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_26 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_27 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_27 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_27 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_27 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_28 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_28 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_28 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_28 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_29 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_29 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_29 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_29 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_30 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_30 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_30 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_30 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_31 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_31 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_31 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_31 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_32 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_32 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_32 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_32 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_33 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_33 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_33 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_33 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_34 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_34 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_34 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_34 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_35 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_35 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_35 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_35 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_36 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_36 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_36 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_36 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_37 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_37 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_37 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_37 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_38 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_38 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_38 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_38 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_39 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_39 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_39 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_39 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_40 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_40 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_40 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_40 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_41 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_41 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_41 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_41 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_42 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_42 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_42 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_42 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_43 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_43 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_43 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_43 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_44 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_44 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_44 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_44 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_45 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_45 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_45 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_45 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_46 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_46 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_46 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_46 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_47 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_47 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_47 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_47 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_48 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_48 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_48 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_48 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_49 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_49 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_49 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_49 = models.CharField(max_length=80, blank=True, null=True)
    other_identifier_50 = models.CharField(max_length=20, blank=True, null=True)
    other_identifier_type_50 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_state_50 = models.CharField(max_length=2, blank=True, null=True)
    other_identifier_issuer_50 = models.CharField(max_length=80, blank=True, null=True)
    sole_proprieter = models.CharField(max_length=1, blank=True, null=True)
    org_subpart = models.CharField(max_length=1, blank=True, null=True)
    parent_lbn = models.CharField(max_length=70, blank=True, null=True)
    parent_tin = models.CharField(max_length=9, blank=True, null=True)
    off_name_prefix = models.CharField(max_length=5, blank=True, null=True)
    off_name_suffix = models.CharField(max_length=5, blank=True, null=True)
    off_credentials = models.CharField(max_length=20, blank=True, null=True)
    taxonomy_group_1 = models.TextField(blank=True, null=True)
    taxonomy_group_2 = models.TextField(blank=True, null=True)
    taxonomy_group_3 = models.TextField(blank=True, null=True)
    taxonomy_group_4 = models.TextField(blank=True, null=True)
    taxonomy_group_5 = models.TextField(blank=True, null=True)
    taxonomy_group_6 = models.TextField(blank=True, null=True)
    taxonomy_group_7 = models.TextField(blank=True, null=True)
    taxonomy_group_8 = models.TextField(blank=True, null=True)
    taxonomy_group_9 = models.TextField(blank=True, null=True)
    taxonomy_group_10 = models.TextField(blank=True, null=True)
    taxonomy_group_11 = models.TextField(blank=True, null=True)
    taxonomy_group_12 = models.TextField(blank=True, null=True)
    taxonomy_group_13 = models.TextField(blank=True, null=True)
    taxonomy_group_14 = models.TextField(blank=True, null=True)
    taxonomy_group_15 = models.TextField(blank=True, null=True)
    cert_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'npi'


class NpiTaxonomy(models.Model):
    tax_id = models.AutoField(primary_key=True)
    npi = models.ForeignKey(Npi, models.DO_NOTHING, db_column='npi')
    taxonomy = models.ForeignKey('Taxonomy', models.DO_NOTHING, db_column='taxonomy', blank=True, null=True)
    taxonomy_group = models.TextField(blank=True, null=True)
    taxonomy_classification = models.TextField(blank=True, null=True)
    license_num = models.CharField(max_length=20, blank=True, null=True)
    license_state = models.CharField(max_length=2, blank=True, null=True)
    taxonomy_switch = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'npi_taxonomy'


class Taxonomy(models.Model):
    code = models.TextField(unique=True, blank=True, null=True)
    grouping = models.TextField(blank=True, null=True)
    classification = models.TextField(blank=True, null=True)
    specialization = models.TextField(blank=True, null=True)
    effective_date = models.TextField(blank=True, null=True)
    deactivation_date = models.TextField(blank=True, null=True)
    last_mod_date = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    display_name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'taxonomy'

