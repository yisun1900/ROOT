<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
	String khbh=request.getParameter("khbh");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ͻ�������ĿС�ƣ�<%=khbh%>��</font></B>
</CENTER>

<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�ṹλ��</td>
	<td  width="5%">�ײ���������</td>
	<td  width="6%">��Ʒ���</td>
	<td  width="3%"><span class="STYLE1">�����Ƿ��շ�</span></td>
	<td  width="3%"><span class="STYLE1">ԭ���ۼ���</span></td>
	<td  width="3%"><span class="STYLE1">�����󼶱�</span></td>
	<td  width="3%"><span class="STYLE1">�����շ�����</span></td>
	<td  width="4%"><span class="STYLE1">�������</span></td>
	<td  width="4%"><span class="STYLE1">�����շѽ��</span></td>
	<td  width="4%"><span class="STYLE1">�����д���</span></td>
	<td  width="3%">�Ƿ��ѡ��</td>
	<td  width="3%">������λ</td>
	<td  width="6%">�Ƿ���������</td>
	<td  width="3%">��׼����</td>
	<td  width="4%">ʵ������</td>
	<td  width="4%">ʵ�ʼ��������</td>
	<td  width="4%">ʵ�ʼ�������</td>
	<td  width="5%">ʵ�ʼ�����</td>
	<td  width="3%">�Ƿ�ɼ���</td>
	<td  width="4%">��������������</td>
	<td  width="4%">���ⵥ��</td>
	<td  width="4%">�Ƿ�ɸ���</td>
	<td  width="3%">�ɻ��������</td>
	<td  width="4%">�����ۼ�</td>
	<td  width="4%">�Ƿ�Ҫ����ͬƷ��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	ls_sql="SELECT jgwzbm,bj_khzcxmxj.tcsjflbm,tcsjflmc,bj_khzcxmxj.tccplbbm,jxc_clxlbm.clxlmc,DECODE(sfbxx,'Y','��','N','��') sfbxx,DECODE(sfyxsj,'Y','�շ�','N','��') sfyxsj,a.bjjbmc khbjjbbm,b.bjjbmc,sjsfsl,DECODE(sjcj,0,'',sjcj) sjcj,DECODE(sjsfje,0,'',sjsfje) sjsfje,DECODE(sjsfycx,'1','��','2','���������ƴ���','3','���������ƴ���') sjsfycx  ,jldw,DECODE(bj_khzcxmxj.sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzsl,bzsl,DECODE(bj_khzcxmxj.sfkjm,'1','��','2','����') sfkjm,bj_khzcxmxj.yxjmzdsl,jmdj,DECODE(sfkgh,'1','��','2','�ɻ�') sfkgh,khzdsl,ghzj,DECODE(sfyqxtpp,'Y','��','N','��') sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje";
	ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm,bj_tcsjflbm,bdm_bjjbbm a,bdm_bjjbbm b  ";
    ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxmxj.tcsjflbm=bj_tcsjflbm.tcsjflbm(+) and bj_khzcxmxj.khbh='"+khbh+"'";
    ls_sql+=" and bj_khzcxmxj.khbjjbbm=a.bjjbbm(+) and bj_khzcxmxj.bjjbbm=b.bjjbbm(+)";
    ls_sql+=" order by bj_khzcxmxj.jgwzbm,bj_khzcxmxj.tcsjflbm,bj_khzcxmxj.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={ "jgwzbm","tcsjflmc","clxlmc","sfyxsj","khbjjbbm","bjjbmc","sjsfsl","sjcj","sjsfje","sjsfycx","sfbxx","jldw","sfxzsl","bzsl","sjsl","sjjshsl","sjjmsl","sjjmje","sfkjm","yxjmzdsl","jmdj","sfkgh","khzdsl","ghzj","sfyqxtpp"};
	pageObj.setDisColName(disColName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jgwzbm","1");//�в����������Hash��
	spanColHash.put("tcsjflbm","1");//�в����������Hash��
	spanColHash.put("tcsjflmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
	pageObj.printFoot();
%> 
</table>
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
