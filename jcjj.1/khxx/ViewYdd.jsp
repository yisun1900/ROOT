<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String[] ls=request.getParameterValues("khbh");
if (ls.length>1)
{
	out.println("����ÿ��ֻ��ѡ��һ���ͻ�");
	return;
}

String khbh=ls[0];
String khxm=cf.executeQuery("select khxm from crm_khxx where khbh='"+khbh+"'");

String ls_sql=null;

%>
<center>
  ɾ��δǩ��ͬԤ�������ͻ�������<%=khxm%>��
  <input type="button" value="��ʼɾ��" onclick="window.open('DeleteYdd.jsp?khbh=<%=khbh%>')">
</center>
ľ�ţ�
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">Ԥ�������</td>
	<td  width="3%">����״̬</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="3%">��������</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">��ͬ��װ����</td>
	<td  width="3%">Э�̰�װʱ��</td>
	<td  width="3%">֪ͨ��װʱ��</td>
	<td  width="3%">��װ��ʼ����</td>
	<td  width="3%">��װ��������</td>
	<td  width="3%">ȷ���˵�����</td>
	<td  width="3%">�ɵ�����</td>
	<td  width="3%">��ȡ����</td>
	<td  width="3%">��ͬ���</td>
	<td  width="3%">�������ܶ�</td>
	<td  width="3%">������</td>
	<td  width="3%">�Թ������͹�˾</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="2%">�ͻ����</td>
</tr>
<%
	//ľ��		
	ls_sql="SELECT yddbh,clztmc,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.sccsj,jc_mmydd.htrq,jc_mmydd.jhazsj,kazsj,aztzsj,jc_mmydd.azkssj,jc_mmydd.azjssj,jc_mmydd.tdsj,jc_mmydd.pdgcmc,jc_mmydd.sqdj,jc_mmydd.htje,jc_mmydd.zjhze,DECODE(jc_mmydd.wjqk,'1','�ͻ��Թ�','2','��˾����') wjqk,DECODE(jc_mmydd.wjsgsbz,'Y','���͹�˾','N','δ�͹�˾') wjsgsbz,jc_mmydd.lrsj,a.dwmc lrdw,jc_mmydd.khbh ";
	ls_sql+=" FROM jc_mmydd,sq_dwxx a,jdm_mmyddzt  ";
    ls_sql+=" where jc_mmydd.dwbh=a.dwbh(+)";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" and  jc_mmydd.khbh='"+khbh+"' and jc_mmydd.clzt in('00','01','02','03')";
	ls_sql+=" order by yddbh";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%>
</table>

����
<table border="1" width="340%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�������</td>
	<td  width="2%">����״̬</td>
	<td  width="2%">�����ʦ </td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">��������</td>
	<td  width="2%">��������</td>
	<td  width="2%">ǩԼ����</td>
	<td  width="2%">��ͬ��װ����</td>
	<td  width="2%">��װ��ʼ����</td>
	<td  width="2%">��װ�������</td>
	<td  width="2%">ȷ���˵�����</td>
    <td  width="2%">���ɹ������</td>
    <td  width="5%">��������</td>
    <td  width="5%">��Ӧ��</td>
    <td  width="4%">Ʒ��</td>
    <td  width="5%">�����ʽ</td>
    <td  width="4%">������</td>
    <td  width="4%">����ɫ</td>
    <td  width="3%">̨��Ʒ��</td>
    <td  width="3%">̨�滨ɫ</td>
    <td  width="3%">��������</td>
    <td  width="3%">����</td>
	<td  width="2%">��ȡ����</td>
	<td  width="3%">�������ܶ�</td>
	<td  width="3%">��ͬ�ܶ�</td>
	<td  width="3%">�����ͬ���</td>
	<td  width="3%">̨���ͬ���</td>
	<td  width="3%">����ͬ���</td>
	<td  width="3%">������ͬ���</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="2%">�ͻ����</td>
</tr>
<%
	ls_sql="SELECT jc_cgdd.ddbh,clztmc,DECODE(jc_cgdd.sfpsjs,'1','��','2','��') sfpsjs, jc_cgdd.cgsjs,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.sccsj,jc_cgdd.sfcsj,jc_cgdd.qhtsj,jc_cgdd.jhazrq,jc_cgdd.ksazsj,jc_cgdd.sazrq,jc_cgdd.tdsj,jc_cgdd.pdgc,jc_cgdd.pdgcmc,jc_cgdd.gys,jc_cgdd.ppmc,sdks,xtbc,cghs,tmpp,tmhs,blcz,jiaolian,jc_cgdd.dj,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.lrr,jc_cgdd.lrsj,a.dwmc lrdw,jc_cgdd.khbh ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,sq_dwxx a";
	ls_sql+=" where jc_cgdd.clzt=jdm_cgddzt.clzt(+) and jc_cgdd.dwbh=a.dwbh(+) ";
	ls_sql+=" and  jc_cgdd.khbh='"+khbh+"' and jc_cgdd.clzt in('00','01','03','05','07','09','11')";
	ls_sql+=" order by jc_cgdd.ddbh";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%>

</table>

�Ҿߣ�
<table border="1" width="280%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="2%">�����ʦ</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">�Ҿ߹���</td>
	<td  width="5%">�Ҿ߹���</td>
	<td  width="4%">�Ҿ�Ʒ��</td>
	<td  width="6%">�Ҿ߹�Ӧ��</td>
	<td  width="2%">�Ͳ���</td>
	<td  width="4%">�Ͳ��Ź���</td>
	<td  width="4%">�Ͳ���Ʒ��</td>
	<td  width="6%">�Ͳ��Ź�Ӧ��</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">��������</td>
	<td  width="3%">��ͬ��װ����</td>
	<td  width="3%">��ʼ��װʱ��</td>
	<td  width="3%">��װ�������</td>
	<td  width="3%">ȷ���˵�����</td>
	<td  width="2%">����</td>
	<td  width="3%">��ͬ�ܶ�</td>
	<td  width="3%">�Ҿߺ�ͬ���</td>
	<td  width="3%">�Ͳ��ź�ͬ���</td>
	<td  width="3%">�������ܶ�</td>
	<td  width="3%">�Ҿ���������</td>
	<td  width="3%">�Ͳ�����������</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="3%">�ͻ����</td>
</tr>
<%
	ls_sql="SELECT jc_jjdd.ddbh,clztmc,DECODE(jc_jjdd.sfpsjs,'1','��Ҫ','2','��') sfpsjs,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.pdgc,jc_jjdd.pdgcmc,jc_jjdd.jjppmc,jc_jjdd.jjgys,jc_jjdd.xcmgc,jc_jjdd.xcmgcmc,jc_jjdd.xcmppmc,jc_jjdd.xcmgys,jc_jjdd.qhtsj,jc_jjdd.sccsj,jc_jjdd.jhazrq,jc_jjdd.ksazsj,jc_jjdd.sazrq,jc_jjdd.tdsj,jc_jjdd.dj,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.zjhze,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.lrr,jc_jjdd.lrsj,a.dwmc as lrbm,jc_jjdd.khbh  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,sq_dwxx a";
    ls_sql+=" where jc_jjdd.dwbh=a.dwbh(+) ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
	ls_sql+=" and  jc_jjdd.khbh='"+khbh+"' and jc_jjdd.clzt in('00','01','03','05','07','09','11')";
	ls_sql+=" order by jc_jjdd.ddbh";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%>
</table>

���ģ�
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="2%">�������</td>
   	<td  width="3%">��������</td>
	<td  width="3%">����״̬</td>
	<td  width="4%">���Ĵ���</td>
	<td  width="4%">����С��</td>
	<td  width="4%">Ʒ�ƹ�Ӧ��</td>
	<td  width="4%">Ʒ��</td>
	<td  width="5%">��Ӧ��</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="3%">��ͬ�ܶ�</td>
	<td  width="3%">��������</td>
	<td  width="3%">�����������</td>
	<td  width="3%">�ͻ���������</td>
	<td  width="3%">����ص�</td>
	<td  width="3%">��������</td>
	<td  width="3%">��ͬ�ͻ�ʱ��</td>
	<td  width="3%">�ƻ��ͻ�ʱ��</td>
	<td  width="3%">���ͻ�֪ͨʱ��</td>
	<td  width="3%">ʵ�ͻ�ʱ��</td>
	<td  width="3%">���ʱ��</td>
	<td  width="2%">֪ͨ��Ա</td>
	<td  width="6%">�ͻ����</td>
	<td  width="3%">�ȴ��ͻ�֪ͨ</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="9%">��ע</td>
</tr>
<%
	ls_sql="SELECT jc_zcdd.ddbh,DECODE(jc_zcdd.ddlx,'1','����Ʒ��','2','������Ʒ��','3','��¼��ͬ'),clztmc,zcdlbm,zcxlbm,ppbm,ppmc,gys,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.htcxhdje, DECODE(jc_zcdd.jkxz,'1','δ����','2','ȫ��','3','�����������','4','Ԥ�������'), DECODE(jc_zcdd.jkdd,'1','�������ֳ������','2','�����տ�','3','��˾�����տ�'),jc_zcdd.qhtsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','�������','2','����δ֪ͨ','3','������֪ͨ'),DECODE(jc_zcdd.xclbz,'1','�Ƕ���','2','����ʽ��Ʒ'),jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz";
	ls_sql+=" FROM jc_zcdd,sq_dwxx a,jdm_zcddzt";
	ls_sql+=" where jc_zcdd.dwbh=a.dwbh(+) ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=" and  jc_zcdd.khbh='"+khbh+"' and jc_zcdd.clzt in('00','03','05')";
	ls_sql+=" order by jc_zcdd.ddbh";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%>
</table>
