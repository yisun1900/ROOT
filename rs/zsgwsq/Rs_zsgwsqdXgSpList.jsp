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

	ls_sql="SELECT rs_zsgwsqd.sqxh,DECODE(rs_zsgwsqd.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��') clzt,ztmc,a.dwmc fgsbh,b.dwmc dwbh,rs_zsgwsqd.zsgwmc,rs_zsgwsqd.zbrs,rs_zsgwsqd.slrq,rs_zsgwsqd.sqzbly,rs_zsgwsqd.bmryjg,rs_zsgwsqd.zbgwzn,rs_zsgwsqd.zbgwxcfw,rs_zsgwsqd.sqrq,rs_zsgwsqd.lrr,rs_zsgwsqd.lrsj,c.dwmc lrbm,rs_zsgwsqd.bz,rs_zsgwsqd.spxh,rs_zsgwsqd.shr,rs_zsgwsqd.shsj,shjlmc,rs_zsgwsqd.shyj";
	ls_sql+=" FROM rs_zsgwsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_zsgwsqd.fgsbh=a.dwbh(+) and rs_zsgwsqd.dwbh=b.dwbh(+) and rs_zsgwsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_zsgwsqd.shjl=rs_shjlbm.shjl(+) and rs_zsgwsqd.ztbm=rs_ztbm.ztbm(+)";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_zsgwsqd.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_zsgwsqd.shr='"+yhmc+"'";
	ls_sql+=" and rs_zsgwsqd.ztbm in(select xyztbm from rs_shztlc where ztbm='"+ztbm+"')";

	ls_sql+=" order by rs_zsgwsqd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_zsgwsqdXgSpList.jsp","","","XgSpRs_zsgwsqd.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_zsgwsqd_ygbh","rs_zsgwsqd_yhmc","rs_zsgwsqd_xb","rs_zsgwsqd_yfgsbh","rs_zsgwsqd_dwbh","rs_zsgwsqd_xzzwbm","rs_zsgwsqd_yrzsj","rs_zsgwsqd_ylzrq","rs_zsgwsqd_ylzyy","rs_zsgwsqd_xdwbh","rs_zsgwsqd_xxzzwbm","rs_zsgwsqd_xrzyy","rs_zsgwsqd_lrr","rs_zsgwsqd_lrsj","rs_zsgwsqd_lrbm","rs_zsgwsqd_bz","rs_zsgwsqd_clzt","rs_zsgwsqd_ztbm","rs_zsgwsqd_spxh","rs_zsgwsqd_shr","rs_zsgwsqd_shsj","rs_zsgwsqd_shjl","rs_zsgwsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��������Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSpRs_zsgwsqd.jsp?ztbm="+ztbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_zsgwsqd.jsp";//Ϊ�в�����coluParm.link���ó�������
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
	pageObj.printPageLink(440);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">�������</td>
	<td  width="2%">����״̬</td>
	<td  width="5%">����״̬</td>
	<td  width="3%">�걨��˾</td>
	<td  width="3%">�����λ����</td>
	<td  width="4%">�����λ����</td>
	<td  width="2%">��������</td>
	<td  width="2%">��������</td>
	<td  width="12%">������������</td>
	<td  width="11%">����������Ա�ṹ</td>
	<td  width="11%">������λְ��</td>
	<td  width="7%">������λн�귶Χ</td>

	<td  width="2%">��������</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="8%">��ע</td>
	<td  width="2%">�������</td>
	<td  width="2%">�����</td>
	<td  width="2%">���ʱ��</td>
	<td  width="2%">��˽���</td>
	<td  width="8%">������</td>
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