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

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ztbm=request.getParameter("ztbm");
	if (ztbm!=null)
	{
		if (!(ztbm.equals("")))	wheresql+=" and  (rs_txsqd.ztbm='"+ztbm+"')";
	}

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		wheresql+=" and  (rs_txsqd.fgsbh='"+ssfgs+"')";
	}

	ls_sql="SELECT rs_txsqd.sqxh,rs_txsqd.ztbm,DECODE(rs_txsqd.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��') clzt,ztmc,a.dwmc fgsbh,rs_txsqd.ygbh,rs_txsqd.yhmc, DECODE(rs_txsqd.xb,'M','��','W','Ů') xb,b.dwmc dwbh,rs_txsqd.xzzwbm,rs_txsqd.kssj,rs_txsqd.jzsj,rs_txsqd.ljts,rs_txsqd.yysm,rs_txsqd.sqrq,rs_txsqd.lrr,rs_txsqd.lrsj,c.dwmc lrbm,rs_txsqd.bz,rs_txsqd.spxh,rs_txsqd.shr,rs_txsqd.shsj,shjlmc";
	ls_sql+=" FROM rs_txsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_txsqd.fgsbh=a.dwbh(+) and rs_txsqd.dwbh=b.dwbh(+) and rs_txsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_txsqd.shjl=rs_shjlbm.shjl(+) and rs_txsqd.ztbm=rs_ztbm.ztbm";
    ls_sql+=wheresql;

    ls_sql+=" and rs_txsqd.ztbm in( ";
	ls_sql+=" select rs_shsq.ztbm ";
	ls_sql+=" from rs_shsq,sq_yhssz,rs_ztbm ";
	ls_sql+=" where rs_shsq.yhzbh=sq_yhssz.yhzbh and sq_yhssz.yhdlm='"+yhdlm+"'";
	ls_sql+=" and rs_ztbm.ztlx='07' and rs_ztbm.ztbm=rs_shsq.ztbm";
    ls_sql+=" ) ";

	ls_sql+=" order by rs_txsqd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_txsqdSpList.jsp","","","SpRs_txsqd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("����");
//������ʾ��
	
	String[] disColName={"sqxh","clzt","ztmc","fgsbh","ygbh","yhmc","xb","dwbh","xzzwbm","kssj","jzsj","ljts","yysm","sqrq","lrr","lrsj","lrbm","bz","spxh","shr","shsj","shjlmc"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"sqxh","ztbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"����ͬ��"};//��ť����ʾ����
	String[] buttonLink={"PlSpRs_txsqd.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
  <B><font size="3">����</font></B>
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