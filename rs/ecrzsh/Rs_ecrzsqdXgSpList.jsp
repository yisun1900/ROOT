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
	String ztbm=request.getParameter("ztbm");

	ls_sql="SELECT rs_ecrzsqd.sqxh,DECODE(rs_ecrzsqd.clzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��','05','����ְ'),ztmc,a.dwmc fgsbh,rs_ecrzsqd.ygbh,rs_ecrzsqd.yhmc, DECODE(rs_ecrzsqd.xb,'M','��','W','Ů'),b.dwmc yfgsbh,c.dwmc ydwbh,rs_ecrzsqd.yxzzwbm,rs_ecrzsqd.yrzsj,rs_ecrzsqd.ylzrq,rs_ecrzsqd.ylzyy,d.dwmc xdwbh,rs_ecrzsqd.xxzzwbm,rs_ecrzsqd.xrzyy,rs_ecrzsqd.lrr,rs_ecrzsqd.lrsj,e.dwmc lrbm,rs_ecrzsqd.bz,rs_ecrzsqd.spxh,rs_ecrzsqd.shr,rs_ecrzsqd.shsj,shjlmc";
	ls_sql+=" FROM rs_ecrzsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d,sq_dwxx e,rs_ztbm,rs_shjlbm,rs_ecrzspb ";
    ls_sql+=" where rs_ecrzsqd.fgsbh=a.dwbh(+) and rs_ecrzsqd.lrbm=e.dwbh(+) and rs_ecrzsqd.ztbm=rs_ztbm.ztbm(+)";
    ls_sql+=" and rs_ecrzsqd.yfgsbh=b.dwbh(+) and rs_ecrzsqd.ydwbh=c.dwbh(+) and rs_ecrzsqd.xdwbh=d.dwbh(+)";
    ls_sql+=" and rs_ecrzsqd.shjl=rs_shjlbm.shjl(+)";
    ls_sql+=" and rs_ecrzsqd.spxh=rs_ecrzspb.spxh";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_ecrzsqd.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_ecrzsqd.shr='"+yhmc+"'";
	ls_sql+=" and rs_ecrzspb.yztbm='"+ztbm+"'";
	
	ls_sql+=" order by rs_ecrzsqd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ecrzsqdXgSpList.jsp","","","XgSpRs_ecrzsqd.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//	pageObj.setEditStr("����");
/*
//������ʾ��
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_ecrzsqd_ygbh","rs_ecrzsqd_yhmc","rs_ecrzsqd_xb","rs_ecrzsqd_yfgsbh","rs_ecrzsqd_ydwbh","rs_ecrzsqd_yxzzwbm","rs_ecrzsqd_yrzsj","rs_ecrzsqd_ylzrq","rs_ecrzsqd_ylzyy","rs_ecrzsqd_xdwbh","rs_ecrzsqd_xxzzwbm","rs_ecrzsqd_xrzyy","rs_ecrzsqd_lrr","rs_ecrzsqd_lrsj","rs_ecrzsqd_lrbm","rs_ecrzsqd_bz","rs_ecrzsqd_clzt","rs_ecrzsqd_ztbm","rs_ecrzsqd_spxh","rs_ecrzsqd_shr","rs_ecrzsqd_shsj","rs_ecrzsqd_shjl","rs_ecrzsqd_shyj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��������Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSpRs_ecrzsqd.jsp?ztbm="+ztbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/rs/ecrzsh/ViewRs_ecrzsqd.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">������ְ���룭�޸�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="5%">����״̬</td>
	<td  width="4%">�걨��˾</td>
	<td  width="2%">Ա�����</td>
	<td  width="2%">Ա������</td>
	<td  width="2%">�Ա�</td>
	<td  width="4%">ԭ�ֹ�˾</td>
	<td  width="4%">ԭ����</td>
	<td  width="4%">ԭְλ</td>
	<td  width="3%">�ϴ���ְ����</td>
	<td  width="3%">��ְ����</td>
	<td  width="12%">��ְԭ��</td>
	<td  width="4%">���������ְ����</td>
	<td  width="4%">���������ְְλ</td>
	<td  width="12%">������ְԭ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="7%">��ע</td>
	<td  width="2%">�������</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">��˽���</td>
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