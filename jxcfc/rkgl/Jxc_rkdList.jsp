<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhjs=(String)session.getAttribute("yhjs");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String jxc_rkd_rklx=null;
	String jxc_rkd_rkdzt=null;
	String jxc_rkd_dqbm=null;
	String jxc_rkd_ckbh=null;
	jxc_rkd_rklx=request.getParameter("jxc_rkd_rklx");
	if (jxc_rkd_rklx!=null)
	{
		jxc_rkd_rklx=cf.GB2Uni(jxc_rkd_rklx);
		if (!(jxc_rkd_rklx.equals("")))	wheresql+=" and  (jxc_rkd.rklx='"+jxc_rkd_rklx+"')";
	}
	jxc_rkd_rkdzt=request.getParameter("jxc_rkd_rkdzt");
	if (jxc_rkd_rkdzt!=null)
	{
		jxc_rkd_rkdzt=cf.GB2Uni(jxc_rkd_rkdzt);
		if (!(jxc_rkd_rkdzt.equals("")))	wheresql+=" and  (jxc_rkd.rkdzt='"+jxc_rkd_rkdzt+"')";
	}
	jxc_rkd_dqbm=request.getParameter("jxc_rkd_dqbm");
	if (jxc_rkd_dqbm!=null)
	{
		jxc_rkd_dqbm=cf.GB2Uni(jxc_rkd_dqbm);
		if (!(jxc_rkd_dqbm.equals("")))	wheresql+=" and  (jxc_rkd.dqbm='"+jxc_rkd_dqbm+"')";
	}
	jxc_rkd_ckbh=request.getParameter("jxc_rkd_ckbh");
	if (jxc_rkd_ckbh!=null)
	{
		jxc_rkd_ckbh=cf.GB2Uni(jxc_rkd_ckbh);
		if (!(jxc_rkd_ckbh.equals("")))	wheresql+=" and  (jxc_rkd.ckbh='"+jxc_rkd_ckbh+"')";
	}


	String jxc_rkd_rkph=null;
	String jxc_rkd_lydh=null;
	String jxc_rkd_gysmc=null;
	String jxc_rkd_gysmc2=null;
	String jxc_rkd_rkr=null;
	String rkrssbm=null;
	String jxc_rkd_rksj=null;


	jxc_rkd_rkph=request.getParameter("jxc_rkd_rkph");
	if (jxc_rkd_rkph!=null)
	{
		jxc_rkd_rkph=cf.GB2Uni(jxc_rkd_rkph);
		if (!(jxc_rkd_rkph.equals("")))	wheresql+=" and  (jxc_rkd.rkph='"+jxc_rkd_rkph+"')";
	}
	jxc_rkd_lydh=request.getParameter("jxc_rkd_lydh");
	if (jxc_rkd_lydh!=null)
	{
		jxc_rkd_lydh=cf.GB2Uni(jxc_rkd_lydh);
		if (!(jxc_rkd_lydh.equals("")))	wheresql+=" and  (jxc_rkd.lydh='"+jxc_rkd_lydh+"')";
	}
	jxc_rkd_rkr=request.getParameter("jxc_rkd_rkr");
	if (jxc_rkd_rkr!=null)
	{
		jxc_rkd_rkr=cf.GB2Uni(jxc_rkd_rkr);
		if (!(jxc_rkd_rkr.equals("")))	wheresql+=" and  (jxc_rkd.rkr='"+jxc_rkd_rkr+"')";
	}
	rkrssbm=request.getParameter("rkrssbm");
	if (rkrssbm!=null)
	{
		rkrssbm=cf.GB2Uni(rkrssbm);
		if (!(rkrssbm.equals("")))	wheresql+=" and  (jxc_rkd.rkrssbm='"+rkrssbm+"')";
	}
	jxc_rkd_rksj=request.getParameter("jxc_rkd_rksj");
	if (jxc_rkd_rksj!=null)
	{
		jxc_rkd_rksj=jxc_rkd_rksj.trim();
		if (!(jxc_rkd_rksj.equals("")))	wheresql+="  and (jxc_rkd.rksj>=TO_DATE('"+jxc_rkd_rksj+"','YYYY/MM/DD'))";
	}
	jxc_rkd_rksj=request.getParameter("jxc_rkd_rksj2");
	if (jxc_rkd_rksj!=null)
	{
		jxc_rkd_rksj=jxc_rkd_rksj.trim();
		if (!(jxc_rkd_rksj.equals("")))	wheresql+="  and (jxc_rkd.rksj<=TO_DATE('"+jxc_rkd_rksj+"','YYYY/MM/DD'))";
	}
	jxc_rkd_gysmc=request.getParameter("jxc_rkd_gysmc");
	if (jxc_rkd_gysmc!=null)
	{
		jxc_rkd_gysmc=cf.GB2Uni(jxc_rkd_gysmc);
		if (!(jxc_rkd_gysmc.equals("")))	wheresql+=" and  (jxc_rkd.gysmc='"+jxc_rkd_gysmc+"')";
	}
	jxc_rkd_gysmc2=request.getParameter("jxc_rkd_gysmc2");
	if (jxc_rkd_gysmc2!=null)
	{
		jxc_rkd_gysmc2=cf.GB2Uni(jxc_rkd_gysmc2);
		if (!(jxc_rkd_gysmc2.equals("")))	wheresql+=" and  (jxc_rkd.gysmc like '%"+jxc_rkd_gysmc2+"%')";
	}



	ls_sql="SELECT jxc_rkd.rkph,DECODE(jxc_rkd.rkdzt,'0','δ�ύ','1','�ȴ����','2','�ȴ����','3','�����','4','�ѽ���','6','�ȴ��ܲ����'),DECODE(jxc_rkd.rklx,'C','�ɹ����','T','�˻����','R','�������','S','�깺���','J','����ȯ�˻����','D','���Ķ����˻�','F','���������','Z','ֱ�����') rklx,jxc_ckmc.ckmc,jxc_rkd.rkr,jxc_rkd.rksj,jxc_rkd.rkzje,dm_dqbm.dqmc,jxc_rkd.gysmc,jxc_rkd.lydh";
	ls_sql+=" FROM jxc_rkd,jxc_ckmc,dm_dqbm ";
    ls_sql+=" where jxc_rkd.ckbh=jxc_ckmc.ckbh and jxc_rkd.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and jxc_rkd.rkcllx='1'";//0�����ģ�1������
    ls_sql+=" and jxc_rkd.sfxnrkd='N'";//Y���ǣ�N����

	if (!yhjs.equals("A0"))
	{
		ls_sql+=" and jxc_rkd.ckbh in(select ckbh from jxc_kgy where yhdlm='"+yhdlm+"')";
	}
	
	ls_sql+=wheresql;
    ls_sql+=" order by jxc_rkd.rksj desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Jxc_rkdList.jsp","","","EditJxc_rkdMain.jsp");

//��������
	String[] keyName={"rkph"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ����ⵥ"};//��ť����ʾ����
	String[] buttonLink={"deleteRkd.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"rkph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_rkd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("rkph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

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
  <B><font size="3">��⣭ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="9%">�������</td>
	<td  width="6%">��ⵥ״̬</td>
	<td  width="6%">�������</td>
	<td  width="10%">���ֿ�</td>
	<td  width="6%">�����</td>
	<td  width="8%">���ʱ��</td>
	<td  width="9%">����ܽ��</td>
	<td  width="6%">����</td>
	<td  width="18%">������λ</td>
	<td  width="15%">��Դ����</td>
</tr>
<%
	pageObj.displayDateSum();
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