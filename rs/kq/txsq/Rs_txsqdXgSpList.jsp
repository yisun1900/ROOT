<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ztbm=request.getParameter("ztbm");

	ls_sql="SELECT rs_txsqd.sqxh,DECODE(rs_txsqd.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),ztmc,a.dwmc fgsbh,rs_txsqd.ygbh,rs_txsqd.yhmc, DECODE(rs_txsqd.xb,'M','��','W','Ů'),b.dwmc dwbh,rs_txsqd.xzzwbm,rs_txsqd.kssj,rs_txsqd.jzsj,rs_txsqd.ljts,rs_txsqd.yysm,rs_txsqd.sqrq,rs_txsqd.lrr,rs_txsqd.lrsj,c.dwmc lrbm,rs_txsqd.bz,rs_txsqd.spxh,rs_txsqd.shr,rs_txsqd.shsj,shjlmc";
	ls_sql+=" FROM rs_txsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_txsqd.fgsbh=a.dwbh(+) and rs_txsqd.dwbh=b.dwbh(+) and rs_txsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_txsqd.shjl=rs_shjlbm.shjl(+) and rs_txsqd.ztbm=rs_ztbm.ztbm";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_txsqd.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_txsqd.shr='"+yhmc+"'";
	ls_sql+=" and rs_txsqd.ztbm in(select xyztbm from rs_shztlc where ztbm='"+ztbm+"')";

	ls_sql+=" order by rs_txsqd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_txsqdXgSpList.jsp","","","XgSpRs_txsqd.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_txsqd_ygbh","rs_txsqd_yhmc","rs_txsqd_xb","rs_txsqd_yfgsbh","rs_txsqd_dwbh","rs_txsqd_xzzwbm","rs_txsqd_yrzsj","rs_txsqd_ylzrq","rs_txsqd_ylzyy","rs_txsqd_xdwbh","rs_txsqd_xxzzwbm","rs_txsqd_xrzyy","rs_txsqd_lrr","rs_txsqd_lrsj","rs_txsqd_lrbm","rs_txsqd_bz","rs_txsqd_clzt","rs_txsqd_ztbm","rs_txsqd_spxh","rs_txsqd_shr","rs_txsqd_shsj","rs_txsqd_shjl","rs_txsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��������Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSpRs_txsqd.jsp?ztbm="+ztbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_txsqd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sqxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="6%">����״̬</td>
	<td  width="5%">�����ֹ�˾</td>
	<td  width="3%">Ա�����</td>
	<td  width="3%">Ա������</td>
	<td  width="2%">�Ա�</td>
	<td  width="5%">��������</td>
	<td  width="4%">ְ��</td>

	<td  width="4%">��ʼʱ��</td>
	<td  width="4%">����ʱ��</td>
	<td  width="3%">�ۼ�����</td>
	<td  width="14%">ԭ��˵��</td>
	<td  width="4%">��������</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="9%">��ע</td>
	<td  width="3%">�������</td>
	<td  width="3%">�����</td>
	<td  width="4%">���ʱ��</td>
	<td  width="4%">��˽���</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>