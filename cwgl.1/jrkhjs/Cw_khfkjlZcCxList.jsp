<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;


	String khbh=request.getParameter("khbh");

	ls_sql="SELECT cw_khfkjl.fkxh,a.fklxmc fklxbm,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������','D','�ײ�������'),cw_khfkjl.ddbh,cw_khfkjl.gysbh,cw_khfkjl.fkje,zffsmc,b.fklxmc zklx,DECODE(dsksjbz,'N','δ���','Y',' ���ͨ��','M','���δͨ��'),cw_khfkjl.sjbh,cw_khfkjl.sksj,cw_khfkjl.sjsj,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.fklxbm=a.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm(+) ";
	ls_sql+=" and cw_khfkjl.ddbh=jc_zcdd.ddbh(+) ";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";

	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.fklxbm in('62')";//62������Ԥ����
	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs not in('16','31')";//16��ֽ�ʲ���ȯ,31��ת������
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx not in('67','55'))";//67����ֵ��ֵ��,55����ɫ������ȯ��
	ls_sql+=" ) ";
	ls_sql+=" ) ";

	ls_sql+=" or ";

	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.fklxbm in('23')";//23:����
	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs not in('16','31')";//16��ֽ�ʲ���ȯ,31��ת������
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx not in('67','55'))";//67����ֵ��ֵ��,55����ɫ������ȯ��
	ls_sql+=" ) ";
	ls_sql+=" ) ";
	ls_sql+=" ) ";

    ls_sql+=" order by fklxbm,zffs,zklx,jc_zcdd.ddlx,cw_khfkjl.ddbh,fkxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","fkxh","cw_khfkjl_sjbh","cw_khfkjl_jsjlh","cw_khfkjl_fklx","cw_khfkjl_fkje","cw_khfkjl_skr","cw_khfkjl_sksj","cw_khfkjl_lrdw","cw_khfkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fkxh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"fkxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/cwgl/qyecx/ViewCw_khfkjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fkxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"fkxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/cwgl/qyecx/ViewKhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ֽ����Ŀ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�տ����</td>
	<td  width="7%">�տ�����</td>
	<td  width="8%">��������</td>
	<td  width="7%">����</td>
	<td  width="11%">�տ�Ʒ��</td>
	<td  width="7%">ʵ�տ���</td>
	<td  width="6%">֧����ʽ</td>
	<td  width="7%">ת������</td>
	<td  width="6%">��˱�־</td>
	<td  width="8%">�վݱ��</td>
	<td  width="7%">�տ�ʱ��</td>
	<td  width="7%">���ʱ��</td>
	<td  width="20%">��ע</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.displayFoot();
%> 

</body>

</html>