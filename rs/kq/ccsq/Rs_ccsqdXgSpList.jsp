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

	ls_sql="SELECT rs_ccsqd.sqxh,DECODE(rs_ccsqd.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),ztmc,a.dwmc fgsbh,rs_ccsqd.ygbh,rs_ccsqd.yhmc, DECODE(rs_ccsqd.xb,'M','��','W','Ů'),b.dwmc dwbh,rs_ccsqd.xzzwbm,rs_ccsqd.kssj,rs_ccsqd.jzsj,rs_ccsqd.ljts,rs_ccsqd.yysm,rs_ccsqd.sqrq,rs_ccsqd.lrr,rs_ccsqd.lrsj,c.dwmc lrbm,rs_ccsqd.bz,rs_ccsqd.spxh,rs_ccsqd.shr,rs_ccsqd.shsj,shjlmc";
	ls_sql+=" FROM rs_ccsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_ccsqd.fgsbh=a.dwbh(+) and rs_ccsqd.dwbh=b.dwbh(+) and rs_ccsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_ccsqd.shjl=rs_shjlbm.shjl(+) and rs_ccsqd.ztbm=rs_ztbm.ztbm";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_ccsqd.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_ccsqd.shr='"+yhmc+"'";
	ls_sql+=" and rs_ccsqd.ztbm in(select xyztbm from rs_shztlc where ztbm='"+ztbm+"')";

	ls_sql+=" order by rs_ccsqd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ccsqdXgSpList.jsp","","","XgSpRs_ccsqd.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_ccsqd_ygbh","rs_ccsqd_yhmc","rs_ccsqd_xb","rs_ccsqd_yfgsbh","rs_ccsqd_dwbh","rs_ccsqd_xzzwbm","rs_ccsqd_yrzsj","rs_ccsqd_ylzrq","rs_ccsqd_ylzyy","rs_ccsqd_xdwbh","rs_ccsqd_xxzzwbm","rs_ccsqd_xrzyy","rs_ccsqd_lrr","rs_ccsqd_lrsj","rs_ccsqd_lrbm","rs_ccsqd_bz","rs_ccsqd_clzt","rs_ccsqd_ztbm","rs_ccsqd_spxh","rs_ccsqd_shr","rs_ccsqd_shsj","rs_ccsqd_shjl","rs_ccsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��������Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSpRs_ccsqd.jsp?ztbm="+ztbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_ccsqd.jsp";//Ϊ�в�����coluParm.link���ó�������
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